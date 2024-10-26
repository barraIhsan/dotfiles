-- import luasnip and add shorthand
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

return {
  s(
    { trig = "---", desc = "A basic frontmatter template for my blog" },
    fmta(
      [[
        ---
        title: <>
        desc: <>
        pubDate: <>
        ---
        <>
      ]],
      { i(1), i(2), i(3, os.date("%Y-%m-%d")), i(0) }
    )
  ),
}
