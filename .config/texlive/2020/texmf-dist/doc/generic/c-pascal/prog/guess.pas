program guess;

var
  num1, num2: integer;

begin
  randomize;
  num2 := random(100);

  repeat
    { make user guess }
    write('Guess my number: ');
    readln(num1);

    { check the relation }
    if num1 = num2 then
      writeln('Very well!');
    if num1 < num2 then
      writeln('Too small.');
    if num1 > num2 then
      writeln('Too big.');
  until num1 = num2;

  { pause }
  readln;
end.
