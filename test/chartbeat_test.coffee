chai = require 'chai'
sinon = require 'sinon'
sinonChai = require 'sinon-chai'
chai.use(sinonChai)

expect = chai.expect

describe 'chartbeat', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/chartbeat')(@robot)

  it 'responds with default domain', ->
    expect(@robot.respond).to.have.been.calledWith(/chart( me)? (.*)/i)
