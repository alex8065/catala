let Foo = require("../_build/default/foo/test_api_web.bc.js")
try {
  Foo.TestLib.foo(
    {testIn:true}
  )
} catch (e) {console.log(e)}
