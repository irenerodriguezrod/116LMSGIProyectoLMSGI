(:
5. Nombre de los cursos que no han finalizado
:)

(: Cambia valor a uno de los cursos para que nos devuelva resultado, ya que todos los cursos finalizaron en 2024

for $curso in collection(academia)/curso
where $curso/@id="1"
return
  replace value of node $curso/fin with "01/12/2025"
:)

(:
Consulta

for $x in collection("academia")/curso

where current-date()=

return:)

declare function local:convertir-fecha($fecha as xs:string) as xs:string {
  (: Separar la fecha en día, mes, año usando '/' como delimitador :)
  let $partes := fn:tokenize($fecha, "/")
  let $dia := fn:format-number(xs:integer($partes[1]), "01") (: Asegura 2 dígitos para el día :)
  let $mes := fn:format-number(xs:integer($partes[2]), "01") (: Asegura 2 dígitos para el mes :)
  let $anio := fn:format-number(xs:integer($partes[3]), "0001") (: Asegura 4 dígitos para el año :)
  let $fechaISO := concat($anio, "-", $mes, "-", $dia) (: Formato YYYY-MM-DD :)
  return
    if (fn:matches($fechaISO, "^\d{4}-\d{2}-\d{2}$") and xs:date($fechaISO)) then
      (: Validar que sea una fecha válida y formatearla :)
      fn:format-date(xs:date($fechaISO), "[Y0001]-[M01]-[D01]")
    else
      "Fecha inválida"
};