# Requirements

- Python 3.8.2 or above

- Robot Framework - 3.2.2

# Instalation

## Windows

- Python Instalation

```
https://www.python.org/downloads/
```

- Validate Instalation

```
pip --version
```

- Robot Framework Instalation

```
pip install robotframework
```

- Installation of required libraries

```
pip install -r requirements.txt
```

*requiriments.txt: file inside the project that contains all the libraries needed for automation*


# Libraries used

[RequestsLibrary](https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html)

[JsonLibrary](https://robotframework-thailand.github.io/robotframework-jsonlibrary/JSONLibrary.html)

[PyYAML](https://pyyaml.org/wiki/PyYAMLDocumentation)

[JsonValidator](https://pypi.org/project/robotframework-jsonvalidator/)

# Command to run the tests:
In CMDER, enter the root folder of the project;
Cd C: ... (folder path)

Type in cmder:
robot -d result -V resource/utils/config_helper.py -L trace -i API_store -i API_pet tests

# For acess the Log
Copy the path log appear in cmder