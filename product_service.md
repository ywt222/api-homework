假定某电商系统，随着业务的发展，需要将产品的模块，从现有的单块架构逻辑中剥离出来，形成一个用于专门提供产品数据的服务，便于维护和扩展。

作为产品部分，通常具有如下的属性：产品名称、产品分类、价格、创建时间、修改时间等。当然，在真实的情况下，其相关的属性可能会更复杂。

首先，让我们来分析一下如果需要构建这样一个提供产品数据的服务，其应该具备哪些功能或者接口。

- 创建一个新的产品


```
Path:          /products
Verb:          POST
Accept: 	   application/json   
RequestBody:   { 
                    'name':'Docker In Action',
                    'category':'Book',
                    'price':56.00
               }
               
               
Response code: 201
Response body: { 
                    'name':'Docker In Action',
                    'category':'Book',
                    'price':56.00
               }
```

- 获取现有的产品列表

```
Path:          /products
Verb:          GET
Accept:        application/json


Response code: 200
Response Body: [
					{ 
                    	'name':'Docker In Action',
                    	'category':'Book',
                    	'price':56.00
               		},
               		{ 
                    	'name':'Super Computer',
                    	'category':'Device',
                    	'price':180.00
               		}
				]
```

- 获取某个产品的明细

```
Path:          /products/:id
Verb:          GET
Accept:        application/json

Response code: 200
Response body: { 
                    'name':'Docker In Action',
                    'category':'Book',
                    'price':56.00
               }
```

- 修改某个产品的明细	
	
```
Path:          /products/:id
Verb:          PUT
Request Body:  {
                    'name':'Docker In Action',
                    'category':'Book',
                    'price':50.00
               }
               
Response body: {
                    'name':'Docker In Action',
                    'category':'Book',
                    'price':50.00
               }
```

- 删除某个产品

```
Path:          /products/:id
Verb:          DELETE
```