Elixir + Blockchains = Fun

TODO
  - try it out on multiple nodes at high difficulty
  - consensus checking
  - add node to node tansactions
  - idiomatic Elixir
  - read up in uuids
  - read up on plug

To Try - `Elixir 1.5` `Erlang 20`
```
mix deps.get
mix run --no-halt
localhost:4000/
localhost:4000/mine
```

Block
```
{
  "transactions": [
    {
      "sender": "0",
      "recipient": "52e94c0c-b4d2-11e7-87f8-9200d5102a01",
      "amount": 1
    },
    {
      "sender": "0",
      "recipient": "52e94c0c-b4d2-11e7-87f8-9200d5102a01",
      "amount": 1
    },
    {
      "sender": "0",
      "recipient": "52e94c0c-b4d2-11e7-87f8-9200d5102a01",
      "amount": 1
    },
    {
      "sender": "0",
      "recipient": "52e94c0c-b4d2-11e7-87f8-9200d5102a01",
      "amount": 1
    }
  ],
  "timestamp": "13:49:47.234521",
  "proof": 61240,
  "previous_hash": "A11B21B296DD03C2BE80B01F681E8CEAA8678A2360A91F197BCD6D710BF35C52",
  "index": 5
}
```

Chain
```
[
  {
    "transactions": [

    ],
    "timestamp": "13:49:27.381360",
    "proof": 100,
    "previous_hash": 0,
    "index": 1
  },
  {
    "transactions": [
      {
        "sender": "0",
        "recipient": "52e94c0c-b4d2-11e7-87f8-9200d5102a01",
        "amount": 1
      }
    ],
    "timestamp": "13:49:40.634096",
    "proof": 17465,
    "previous_hash": "A0C54C5078B514D3967CC2C1E599902AE55F07C37871838518FABE1A86751856",
    "index": 2
  },
  {
    "transactions": [
      {
        "sender": "0",
        "recipient": "52e94c0c-b4d2-11e7-87f8-9200d5102a01",
        "amount": 1
      },
      {
        "sender": "0",
        "recipient": "52e94c0c-b4d2-11e7-87f8-9200d5102a01",
        "amount": 1
      }
    ],
    "timestamp": "13:49:43.440264",
    "proof": 21362,
    "previous_hash": "F8FAC39292DE2B72BB43865E4D1A9170762CD848A96B8A3ACD533E834FEF56A0",
    "index": 3
  },
  {
    "transactions": [
      {
        "sender": "0",
        "recipient": "52e94c0c-b4d2-11e7-87f8-9200d5102a01",
        "amount": 1
      },
      {
        "sender": "0",
        "recipient": "52e94c0c-b4d2-11e7-87f8-9200d5102a01",
        "amount": 1
      },
      {
        "sender": "0",
        "recipient": "52e94c0c-b4d2-11e7-87f8-9200d5102a01",
        "amount": 1
      }
    ],
    "timestamp": "13:49:44.837435",
    "proof": 117889,
    "previous_hash": "1114A44845FD5D743A3DF834CE8321B983041DEC4A899A9EE01FFA1CE247A0D4",
    "index": 4
  },
  {
    "transactions": [
      {
        "sender": "0",
        "recipient": "52e94c0c-b4d2-11e7-87f8-9200d5102a01",
        "amount": 1
      },
      {
        "sender": "0",
        "recipient": "52e94c0c-b4d2-11e7-87f8-9200d5102a01",
        "amount": 1
      },
      {
        "sender": "0",
        "recipient": "52e94c0c-b4d2-11e7-87f8-9200d5102a01",
        "amount": 1
      },
      {
        "sender": "0",
        "recipient": "52e94c0c-b4d2-11e7-87f8-9200d5102a01",
        "amount": 1
      }
    ],
    "timestamp": "13:49:47.234521",
    "proof": 61240,
    "previous_hash": "A11B21B296DD03C2BE80B01F681E8CEAA8678A2360A91F197BCD6D710BF35C52",
    "index": 5
  }
]
```
