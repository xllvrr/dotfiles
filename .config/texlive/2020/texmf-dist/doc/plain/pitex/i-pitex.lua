local gsub, match, gmatch = string.gsub, string.match, string.gmatch
local insert = table.insert
local add_pattern = interpreter.add_pattern

-- CLASS 1: things that prevent other things, thanks to protection.
interpreter.default_class = 1

-- "> foo ..." as the first line of a paragraph signals a description
-- of foo.
local function describe (buffer, num)
  if num == 1 then
    local line = buffer[num]
    line = line .. " "
    line = gsub(line, "^> ", "")
    line = gsub(line, "{<(.-)>}", "\\hskip1pt\\hbox{\\barg{%1}}")
    line = gsub(line, "^(.-)%s+", "\\describe{%1}{")
    line = gsub(line, "%[<(.-)>%]", "\\hskip1pt\\hbox{\\oarg{%1}}")
    line = gsub(line, "<(.-)>", "\\hskip1pt\\hbox{\\arg{%1}}")
    line = gsub(line, "\\hfil", "", 1)
    line = gsub(line, "%s*$", "}", 1)
    buffer[num] = line
    interpreter.protect(num)
  else
    return 2
  end
end
add_pattern{pattern = "^[\\>]", call = describe}

-- Verbatim material is marked by a 10-space indent.
local function verbatim (buffer)
  for n, l in ipairs(buffer) do
    buffer[n] = gsub(l, "%s%s%s%s%s%s%s%s%s%s","", 1)
  end
  insert(buffer, 1, [[\verbatim]])
  if gsub(buffer[#buffer],
          interpreter.paragraph, "") == "" then
    buffer[#buffer] = [[\verbatim/]]
  else
    insert(buffer, [[\verbatim/]])
  end
  interpreter.protect()
end
add_pattern{pattern = "^%s%s%s%s%s%s%s%s%s%s", call    = verbatim}

-- CLASS 2: protecting control sequences, so they're verbatim.
interpreter.default_class = 2
add_pattern {
  pattern = "(\\[%a@]+)",
  replace = '"%1"'}


-- CLASS 3: things that precede other things. 
interpreter.default_class = 3

-- Tables.
local function table (buffer)
  buffer[1] = "PROTECT\\tablePROTECT"
  if buffer[#buffer] == "" then
    buffer[#buffer-1] = "PROTECT\\table/PROTECT"
  else
    buffer[#buffer] = "PROTECT\\table/PROTECT"
  end
  local cells = 0
  for i, l in ipairs(buffer) do
    if match(l, "^%-%-%-") then
      l = "%"
    else
      l = gsub(l, "^|", "")
      l = gsub(l, "|%s*$", "PROTECT\\crPROTECT")
      local c = 0
      l = gsub(l, "|", function () c = c + 1 return "&" end)
      cells = c > cells and c or cells
    end
    buffer[i] = l
  end
  for i, l in ipairs(buffer) do
    if match(l, "\\cr") then
      local c = 0
      for tab in gmatch(l, "&") do
        c = c + 1
      end
      for x = 1, cells - c do
        buffer[i] = gsub(l, "\\cr", "\\span\\cr")
      end
    end
  end
end
add_pattern{pattern = "^%-%-%-", call = table}

-- Sections.
local function make_header(buffer, num, _, pattern)
	if num + 1 == #buffer then
    local l = buffer[1]
		l = gsub(l, "^%s*", "")
		l = "\\" .. pattern.type .. "{" .. l
    if match(l, ":([%S]+)%s*$") then
      l = gsub(l, "%s*:([%a_]+)%s*$", "}PROTECT[%1]PROTECT")
    else
      l = l .. "}"
    end
    buffer[1] = l
		buffer[num] = ""
	end
end
add_pattern {pattern = "^%s*===", call = make_header, type = "section"}
add_pattern {pattern = "^%s*~~~", call = make_header, type = "subsection"}
add_pattern {pattern = "^%s%s%s*%-%-%s+(.-)%s+%-%-",
  call = function (buffer, line, _, pattern)
    buffer[line] = gsub(buffer[line], pattern.pattern, "\\paragraph{%1}")
    buffer[line] = gsub(buffer[line], "%s*:(%S+)", "PROTECT[%1]PROTECT")
  end}


-- CLASS 4: things with no order of preference.
interpreter.default_class = 4

add_pattern {pattern = "%*(.-)%*", replace = "\\emph{%1}"}
add_pattern {pattern = "%*%*(.-)%*%*", replace = "\\bold{%1}"}
add_pattern {pattern = "%?([a-zA-Z]+)", replace = "\\attr{%1}"}
add_pattern {pattern = "!([a-zA-Z]+)", replace = "\\param{%1}"}
add_pattern {pattern = "=([a-zA-Z]+)", replace = "\\value{%1}"}
add_pattern {pattern = "|(.-)|", replace = "\\gateaction{%1}"}
add_pattern {pattern = "<(.-)>", replace = "\\arg{%1}"}
add_pattern {pattern = "{<(.-)>}", replace = "\\barg{%1}", offset = 7}
add_pattern {pattern = "%[<(.-)>%]", replace = "\\oarg{%1}", offset = 7}
add_pattern {pattern = "TeX", replace = "\\TeX{}", offset  = 2}

add_pattern {pattern = "(texapi)(.?)", offset = 7,
             replace = function (a, b)
                a = "\\emph{texapi}"
                if b == "'" then
                  a = a .. "\\kern.2em'"
                else
                  a = a .. b
                end
                return a
              end}

-- Links.
add_pattern {pattern = "%s*%[see%s+([%a_]+)%]",
  call = function (buffer, line, index, pattern)
    local l = buffer[line]
    local pre, post = l:sub(1, index-1), l:sub(index)
    local text
    if pre:match("{.-}$") then
      pre, text = match(pre, "(.*){(.-)}$")
    else
      pre, text = match(pre, "(.-)(%a+)$")
    end
    post = gsub(post, pattern.pattern, "\\jumplink{PROTECT%1PROTECT}{" .. text .. "}", 1)
    buffer[line] = pre .. post
  end}
add_pattern {pattern = ":([%a_]+)", replace = "\\anchor{PROTECT%1PROTECT}"}


-- CLASS 0: the broom wagon
interpreter.default_class = 0

interpreter.protector('"')
add_pattern {pattern = '"(.-)"', replace = "\\verb`%1`", class = 0}

interpreter.protector("PROTECT")
add_pattern {pattern = "PROTECT(.-)PROTECT", replace = "%1", class = 0}
