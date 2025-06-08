(:PREGUNTA 4.- Se pide mostrar la distribución y versión de ubuntu y redhat en un ficheroAdd commentMore actions
json, transformando 01.xml en 04.json mediante XQUERY o XSLT.:)
declare option output:indent "yes"; 
concat(
  "{ lanzamientos: [",
  string-join(
    for $x in //lanzamiento[@distribucion='redhat' or @distribucion='ubuntu']
    return concat(
      '{"distribucion":"', data($x/@distribucion),
      '", "version":"', data($x/@version),
      '"}'
    ),
    ", "
  ),
  "]}"
)