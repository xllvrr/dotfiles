const csv = require('csv-parser')
const fs = require('fs')
const results = [];

function readCSVsimple(filename, callback){
	
	fs.createReadStream(filename)
	  .pipe(csv())
	  .on('data', (data) => results.push(data))
	  .on('end', () => {
		callback();
	  });
}

readCSVsimple('annser.csv', ()=>{
	readCSVsimple('custom.csv', ()=>{
		writeSTY()
	});
});

function createSynonyms(results){
	for(let i = 0; i < results.length; i++) {
		let res = results[i];
		if(/^The\s+/.test(res['Full Title'])){
			results.push({
				'Full Title' : res['Full Title'].replace(/^The\s+/,''),
				'Abbrev' : res['Abbrev']
			});
		}		
		if(/\s*\(*New\Series\.*\)*$/.test(res['Full Title'])){
			results.push({
				'Full Title' : res['Full Title'].replace(/\s*\(*New\Series\.*\)*$/,''),
				'Abbrev' : res['Abbrev']
			});
		}
	}

}

function resultsToReplacementMap(results){
	const replacementMap = [];
	createSynonyms(results);
	results.map(res => {
		if(res['Full Title'] === res['Abbrev']){
			// Full and Abbreviated titles are equal, thus do nothing
			return;
		}
		if(!res['Full Title'] || !res['Abbrev']){
			// Nothing to replace!
			return;
		}
		if(res['Full Title'].search(/\$/) !== -1 || res['Abbrev'].search(/\$/) !== -1){
			// Just skip journals with formulas in titles
			return;
		}
		res['Full Title'] = res['Full Title'].replace(/&/g,'\\&');
		res['Abbrev'] = res['Abbrev'].replace(/&/g,'\\&');
		replacementMap.push([res['Full Title'],res['Abbrev']]);
	});
	return replacementMap;
}



function writeSTY(){
	styContent = fs.readFileSync('shortmathj.template.sty','utf8');

	let alphabet = {};
	let replacementMap = resultsToReplacementMap(results);
	replacementMap.map(rule => {
		alphabet[rule[0].substr(0,1)] = [];
	});
	replacementMap.map(rule => {
		alphabet[rule[0].substr(0,1)].push(
			"\\ifthenelse{\\equal{\\givenAMSjournalname}{\\detokenize{"+rule[0]+"}}}{\\def\\shortifiedAMSjournalname{"+rule[1]+"}}{}%\n"
		);
	});

	let replacement="";

	for(let letter in alphabet){
		replacement +=
			"\\ifthenelse{\\equal{\\firstletter}{\\detokenize{"+letter+"}}}{%\n" +
			alphabet[letter].join('') +
			"}{}%\n";
	}



	styContent = styContent.replace(/\%\%\%\{\{SHORTMAP[\s\S]*\%\%\%\}\}SHORTMAP/, replacement + "%");

	fs.writeFileSync('shortmathj.sty', styContent);
}
