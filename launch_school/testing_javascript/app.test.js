import app from './app';
import nock from 'nock';
import request from 'supertest';

test('get Chunk Norris joke', async () => {
    const mockResponse = {
        "type": "success",
        "value": {
            "id": 268,
            "joke": "He who lives by the sword, dies by the sword. He who lives by Chuck Norris, dies by the roundhouse kick.",
            "categories": [
]
        }
    }
    nock('http://api.icndb.com')
        .get('/jokes/random')
        .reply(200, mockResponse);
    const res = await request(app).get('/');
    expect(res.status).toBe(200);
    expect(res.body).toEqual(mockResponse);
});
