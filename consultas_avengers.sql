-- CONSULTA 1
SELECT
    d.nombre AS departamento,
    COUNT(p.id) AS miembros_activos
FROM departamentos d
INNER JOIN personas p
    ON p.DEPARTAMENTOS_id = d.id
WHERE p.estado = 'Activo'
GROUP BY d.id, d.nombre
ORDER BY miembros_activos DESC;


-- CONSULTA 2
SELECT
    d.nombre AS departamento,
    SUM(p.horas_mision) AS horas_totales
FROM departamentos d
INNER JOIN personas p
    ON p.DEPARTAMENTOS_id = d.id
WHERE p.aumentado = TRUE
  AND p.tipo_miembro IN ('Principal', 'Militar')
GROUP BY d.id, d.nombre;


-- CONSULTA 3
SELECT
    pr.nombre AS proveedor,
    COUNT(a.id) AS armas_experimentales
FROM proveedores pr
INNER JOIN arma_proveedor ap
    ON ap.PROVEEDORES_id = pr.id
INNER JOIN armas a
    ON a.id = ap.ARMAS_id
WHERE a.experimental = TRUE
GROUP BY pr.id, pr.nombre
ORDER BY armas_experimentales DESC;


-- CONSULTA 4
SELECT
    d.nombre AS departamento,
    SUM(m.horas_totales) AS horas_exitosas
FROM misiones m
INNER JOIN grupos g
    ON m.responsable_grupo_id = g.id
INNER JOIN departamentos d
    ON g.DEPARTAMENTOS_id = d.id
WHERE m.resultado = 'Exito'
GROUP BY d.id, d.nombre
HAVING SUM(m.horas_totales) > 100;


-- CONSULTA 5
SELECT
    p.nombre_completo,
    COUNT(a.id) AS numero_reportes
FROM personas p
INNER JOIN amenazas a
    ON a.PERSONAS_id = p.id
WHERE p.tipo_miembro <> 'Civil'
GROUP BY p.id, p.nombre_completo
HAVING COUNT(a.id) > 1;