const apiBaseUrl = 'http://' + process.env.API_HOST + ':' + process.env.API_PORT
const chai = require('chai');
const chaiHttp = require('chai-http');
const should = chai.should();
chai.use(chaiHttp);

describe('/placeholder/', function() {
  it('responds with 200 and expected json', function(done) {
    chai.request(apiBaseUrl)
      .get('/placeholder/')
      .set('Accept', 'application/json')
      .end((err, res) => {
        res.should.have.status(200);
        res.should.have.header('Content-Type', /json/);
        res.body.message.should.equal('This is the Placeholder API');
        done();
      }
    )
    ;
  });
});
