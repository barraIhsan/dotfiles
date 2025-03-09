-- import luasnip and add shorthand
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- add conventional commit snippet to help you choose the type
-- refer to https://www.conventionalcommits.org
-- https://gist.github.com/qoomon/5dfcdf8eec66a051ecd85625518cfd13
-- stylua: ignore
return {
  -- type
  s({ trig = "feat", desc = "Add, update, or remove a feature" }, t("feat: ")),
  s({ trig = "fix", desc = "Fix a bug in an existing feature" }, t("fix: ")),
  s({ trig = "docs", desc = "Documentation changes" }, t("docs: ")),
  s({ trig = "style", desc = "Code style changes (white-space, formatting, etc.)" }, t("style: ")),
  s({ trig = "refactor", desc = "Code refactoring (neither fixes a bug nor adds a feature)" }, t("refactor: ")),
  s({ trig = "perf", desc = "Performance improvements" }, t("perf: ")),
  s({ trig = "test", desc = "Add or update tests" }, t("test: ")),
  s({ trig = "build", desc = "Modify build tools or dependencies" }, t("build: ")),
  s({ trig = "chore", desc = "Routine maintenance like updating .gitignore or dependencies" }, t("chore: ")),
  s({ trig = "ci", desc = "CI/CD pipelines changes" }, t("chore: ")),
  s({ trig = "revert", desc = "Revert a previous commit" }, t("chore: ")),
  -- trailer
  s(
    { trig = "breaking", desc = "Indicates a breaking API changes\nUse `!` before `:` in the summary\nIf `!` is used, `BREAKING CHANGE: ` in the footer is optional" },
    t("BREAKING CHANGE: ")
  ),
  s(
    { trig = "co", desc = "Add a co-author to the commit" },
    { t("Co-authored-by: "), i(1, "name"), t(" <"), i(2, "email"), t(">"), i(0) }
  ),
  s( { trig = "refs", desc = "Reference an issue, pull request, or commit SHA" }, t("Refs: "))
}
