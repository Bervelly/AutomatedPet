*** Variables ***

&{URL_BASE}  base=https://petstore.swagger.io/v2


&{URL_API}   pet=/pet
...          store=/store


&{URL_API_ENDPOINT}     
###### pet
...                  pet_id=${url_api.pet}/{petId}


###### store
...                  store=${url_api.store}/order/{orderId}
...                  order=${url_api.store}/order

