# finance_backend
## API
### Response wrapper
```
{
    message: str
    payload: dict
    success: bool
}
```

### Get income
GET /incomes
#### Request
```
{
    filters: {
        date_to: str
        date_from: str
        category_id: id
    }
}
```

#### Response
```
{
    incomes: [
        {
            income_category_id: int
            value: float
            datetime: str
        },
        {
            income_category_id: int
            value: float
            datetime: str
        }
    ]
}
```


### Add income
 POST /incomes

#### Request
```
{
    income_category_id: int
    value: float
    datetime: str
}
```

#### Response
```
{}
```


### Delete income
DEL /incomes/<id: int>

#### Request
```
{}
```

#### Response
```
{}
```

### PUT /incomes/<id: int>
#### Request
```
{
    income_category_id: int
    value: float
    datetime: str
}
```

#### Response
```
{}
```

### POST /incomes/categories

### POST /expenses
### GET /expenses
### DEL /expenses
### PUT /expenses

### POST /expenses/categories
