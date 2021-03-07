# robot_automation_ui

Project Test with Robot Framework using Page Objects pattern.

3 important flows in Zé Delivery site. I've identified these:

Address Registration: If the user can't enter address, he will not know if the Zé delivery service will be available in his region. 
And if it's available, the products will not be displayed in this case.

Payment: If the payment services need confirmation by cellphone, the purchase can't be completed and the order can't be created.

Cart: If the products selected by the user are not being updated and calculated correctly in the cart, it will cause problem in payment.

I am choose de Card:
1. Search the product
2. Select options 
    - get values
3. Validated values:  
>> validated the product name is same on the shopping cart page.  
>> validated the price of the product is the same on the shopping cart page.  
>> validated the sub total value  
>> validated the total value   

Extras:  
- Highlight function.  
- Trigger Function - More performance in different browsers.  
- Tested in Firefox and Chrome.  
- No sleep e slow option, mode fast.  
- Only one xpath and more IDs.  

1. Dependencies:  
```
robotframework>=3.1.2
robotframework-faker>=4.3.0
robotframework-seleniumlibrary>=4.1.0
robotframework-selenium2library>=3.0.0
robotframework-pageobjectlibrary>=1.0.2
```

How to install:
```
 cd robot_automation_ui   
 pip install -r requirements.txt
```

Command line to runner:
```
robot -v BROWSER:Chrome -i update_value -d target features
robot -v BROWSER:Firefox -i update_value -d target features
```
