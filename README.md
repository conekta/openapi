<h1>
  install openapi generator
</h1>


```node
  npm install @openapitools/openapi-generator-cli -g
```

<h2>
How to use
</h2>

<h3>
java generator proyect

</h3>

```
make java
```

<h2>
From many files to one
<h3>


1. Open a new terminal. Then, install the package swagger-cli globally:
```node
npm install -g swagger-cli
```

2. Run the command to merge all the files into one:
```node
swagger-cli bundle api.yaml --outfile _build/api.yaml --type yaml
```

![distribution](split.png?raw=true "distribution")

## dotnet target framwework
```xml
"targetFramework" : "netstandard2.0;net6.0"
```