import { test } from 'node:test'
import * as assert from 'node:assert'
import { Send } from './aos.helper.js'
import fs from 'node:fs'

function Eval(code) {
  return Send({Action: "Eval", Data: code })
}

test('load source', async () => {
  const mod = fs.readFileSync('./src/dbadmin.lua')
  const dbadminSrc = `
function _load () 
  ${mod}
end
_G.package.loaded['dbadmin'] = _load()
`
  await Eval(dbadminSrc)

  const code = fs.readFileSync('./src/claims.lua', 'utf-8')
  const result = await Eval(code)
  assert.equal(result.Output.data.prompt, "aos> ")
})


test('load tables', async () => {
  const result = await Eval('InitDB()')
  assert.equal(result.Output.data.output, "ok")
})

test('submit claim', async () => {
  const result = await Send({
    Action: "Submit-Claim",
    Github: "twilson63",
    SourceUrl: "https://github.com/twilson63/myproject",
    Quest: "Gather:MobileUX"
  })
  assert.equal(result.Output.data, 'Successfully added Claim for: twilson63')
})

test('get claim', async () => {
  const result = await Send({
    Action: "Get-Claim",
    Github: "twilson63"
  })
  assert.equal(JSON.parse(result.Messages[0].Data)[0].Quest, "Gather:MobileUX")

})

