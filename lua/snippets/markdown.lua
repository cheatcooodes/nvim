local ls = require("luasnip")

local snippet = ls.snippet
local snip = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamic = ls.dynamic_node
local restore = ls.restore_node
local lambda = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local partial = require("luasnip.extras").partial
local match = require("luasnip.extras").match
local nonempty = require("luasnip.extras").nonempty
local dynamic_lambdal = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")


-- Latex context aware
local tex = {}
tex.in_mathzone = function ()
	return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

tex.in_text = function ()
	return not tex.in_mathzone()
end

-- Snippet
ls.add_snippets("markdown",{

-- function
	snippet("f", {
		text "f",
		text "(",
		insert(1),
		text ")",
	}, { show_condition = tex.in_mathzone }),

	snippet("f'", {
		text "f^{'}",
		text "(",
		insert(1),
		text ")",
	}, { show_condition = tex.in_mathzone }),

	snippet("'", {
		text "^{'}",
	}, { show_condition = tex.in_mathzone }),

	-- set
	snippet({
		trig = "in",
		dscr = "\\in ∈"
	}, {
		text "\\in",
	}, { show_condition = tex.in_mathzone }),

	snippet({
		trig = "notin",
		dscr = "\\notin ∉"
	}, {
		text "\\notin",
	}, { show_condition = tex.in_mathzone }),

	snippet({
		trig = "sq",
		dscr = "Square root √"
	}, {
		text "\\sqrt",
		text "{",
		insert(1),
		text "}",
	}, { show_condition = tex.in_mathzone }),

	snippet({
		trig = "inf",
		dscr = "Infinity ∞"
	}, {
		text "\\infty"
	}, { show_condition = tex.in_mathzone }),

	snippet({
		trig = "ti",
		-- snippetType="autosnippet",
	}, {
		text "\\times ×"
	}, { show_condition = tex.in_mathzone }),

	snippet("lim", {
		text "\\lim \\limits_",
		text "{ ",
		insert(1),
		text " \\rightarrow ",
		insert(2),
		text " }",
	}, { show_condition = tex.in_mathzone }),

	snippet({
		trig = "sum",
		dscr = "\\sum ∑"
	}, {
		text "\\sum \\limits",
		text "_{i=",
		insert(1),
		text "}",
		text "^{",
		insert(2),
		text "}",
	}, { show_condition = tex.in_mathzone }),

	snippet({
		trig = "int",
		dscr = "Integral ∫"
	}, {
		text "\\int",
		text "_{",
		insert(1),
		text "}",
		text "^{",
		insert(2),
		text "}",
		insert(0),
	}, { show_condition = tex.in_mathzone }),

	snippet({
		trig = "si ",
		snippetType="autosnippet",
	}, {
		text "\\sigma ",
		insert(0),
	}, { show_condition = tex.in_mathzone }),

	snippet({
		trig = "Si ",
		snippetType="autosnippet",
	}, {
		text "\\Sigma ",
	}, { show_condition = tex.in_mathzone }),

	snippet({
		trig = "pi ",
		snippetType="autosnippet",
	}, {
		text "\\pi ",
	}, { show_condition = tex.in_mathzone }),

	snippet({
		trig = "de ",
		snippetType="autosnippet",
	}, {
		text "\\delta ",
	}, { show_condition = tex.in_mathzone }),

	snippet({
		trig = "De ",
		snippetType="autosnippet",
	}, {
		text "\\Delta ",
	}, { show_condition = tex.in_mathzone }),

	snippet({
		trig = "xi ",
		snippetType="autosnippet",
	}, {
		text "\\xi ",
	}, { show_condition = tex.in_mathzone }),

	snippet("arrow", {
		choice(1, {
			text "\\rightarrow",
			text "\\leftarrow",
			text "\\Rightarrow",
			text "\\Leftarrow",
		}),
	}, { show_condition = tex.in_mathzone }),

	snippet({
		trig="exists",
		dscr="\\exists ∃"
	}, {
		text "\\exists",
	}, { show_condition = tex.in_mathzone }),

	snippet({
		trig="forall",
		dscr="\\forall ∀"
	}, {
		text "\\forall",
	}, { show_condition = tex.in_mathzone }),

	snippet({
		trig="->",
		dscr="\\rightarrow →"
	}, {
		text "\\rightarrow",
	}, { show_condition = tex.in_mathzone }),

	snippet({
		trig="->",
		dscr="\\Rightarrow ⇒",
	}, {
		text "\\Rightarrow",
	}, { show_condition = tex.in_mathzone }),

	snippet("<-", {
		text "\\leftarrow",
	}, { show_condition = tex.in_mathzone }),

	snippet("<-", {
		text "\\Leftarrow",
	}, { show_condition = tex.in_mathzone }),

	snippet({
		trig = ">=",
		snippetType="autosnippet",
	}, {
		text "\\geq",
	}, { show_condition = tex.in_mathzone }),

	snippet({
		trig = "<=",
		snippetType="autosnippet",
	}, {
		text "\\leq",
	}, { show_condition = tex.in_mathzone }),

	snippet("x_", {
		text "x_",
		text "{",
		insert(1),
		text "}"
	}, { show_condition = tex.in_mathzone }),

	snippet("y_", {
		text "y_",
		text "{",
		insert(1),
		text "}"
	}, { show_condition = tex.in_mathzone }),

	snippet("_", {
		text "_{",
		insert(1),
		text "}"
	}, { show_condition = tex.in_mathzone }),

	snippet("^", {
		text "^{",
		insert(1),
		text "}"
	}, { show_condition = tex.in_mathzone }),

	snippet("x^", {
		text "x^",
		text "{",
		insert(1),
		text "}"
	}, { show_condition = tex.in_mathzone }),

	snippet("y^", {
		text "y^",
		text "{",
		insert(1),
		text "}"
	}, { show_condition = tex.in_mathzone }),

	snippet({
		trig = "/ ",
		snippetType="autosnippet",
	}, {
		text "\\frac",
		text "{",
		insert(1),
		text "}{",
		insert(2),
		text "}"
	}, { show_condition = tex.in_mathzone }),

	snippet("frac", {
		text "\\frac",
		text "{",
		insert(1),
		text "}",
		text "{",
		insert(2),
		text "}"
	}, { show_condition = tex.in_mathzone }),

})
