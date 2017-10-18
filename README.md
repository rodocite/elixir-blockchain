Elixir + Blockchains = Fun

Genesis Block
```
{
  "current_transactions": [
    {
      "sender": "Su",
      "recipient": "Rodo",
      "amount": 1
    }
  ],
  "chain": [
    {
      "transactions": [],
      "timestamp": "13:07:22.145373",
      "previous_hash": 1,
      "index": 1
    }
  ]
}
```

Block 2
```
{
  "current_transactions": [
    {
      "sender": "Su",
      "recipient": "Rodo",
      "amount": 1
    },
    {
      "sender": "Rodo",
      "recipient": "Su",
      "amount": 10
    }
  ],
  "chain": [
    {
      "transactions": [],
      "timestamp": "13:07:22.145373",
      "previous_hash": 1,
      "index": 1
    },
    {
      "transactions": [
        {
          "sender": "Su",
          "recipient": "Rodo",
          "amount": 1
        }
      ],
      "timestamp": "14:03:51.924891",
      "previous_hash": "QzWXHIprz1HOGRBI/Ht95rd8p9WwQckKtsCfUAPymYY=",
      "index": 2
    }
  ]
}
```

Block 3
```
{
  "current_transactions": [
    {
      "sender": "Su",
      "recipient": "Rodo",
      "amount": 1
    },
    {
      "sender": "Rodo",
      "recipient": "Su",
      "amount": 10
    },
    {
      "sender": "Molly",
      "recipient": "Serra",
      "amount": 1
    }
  ],
  "chain": [
    {
      "transactions": [],
      "timestamp": "13:07:22.145373",
      "previous_hash": 1,
      "index": 1
    },
    {
      "transactions": [
        {
          "sender": "Su",
          "recipient": "Rodo",
          "amount": 1
        }
      ],
      "timestamp": "14:03:51.924891",
      "previous_hash": "QzWXHIprz1HOGRBI/Ht95rd8p9WwQckKtsCfUAPymYY=",
      "index": 2
    },
    {
      "transactions": [
        {
          "sender": "Su",
          "recipient": "Rodo",
          "amount": 1
        },
        {
          "sender": "Rodo",
          "recipient": "Su",
          "amount": 10
        }
      ],
      "timestamp": "14:03:51.939635",
      "previous_hash": "jKL1scq5ICpJa4yOp5mp5cVnMGe9YPC9OTd8tT7miDY=",
      "index": 3
    }
  ]
}```
