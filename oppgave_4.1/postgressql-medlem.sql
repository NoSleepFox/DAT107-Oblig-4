SELECT
    xmlelement(
        NAME "aktive-medlemmer",
        xmlagg(
            xmlelement(
                NAME medlem,
                xmlattributes(m.medlemsnummer AS "mId"),
                xmlforest(
                    m.fornavn   AS fornavn,
                    m.etternavn AS etternavn
                ),
                xmlelement(
                    NAME "avgift-gjeldende-år",
                    xmlattributes(
                        ma.ar AS "år",
                        ma.betalt AS "betalt",
                        CASE WHEN ma.betalt = 'J'
                            THEN ma.betalingsdato
                        END AS "betalingsdato"
                    )
                )
            )
            ORDER BY m.medlemsnummer
        )
    ) AS xml_resultat
FROM medlem m
JOIN (
    SELECT DISTINCT ON (medlemsnummer) *
    FROM medlemsavgift
    WHERE ar = EXTRACT(YEAR FROM CURRENT_DATE)::INT
    ORDER BY medlemsnummer, betalt DESC
) ma ON ma.medlemsnummer = m.medlemsnummer
WHERE m.aktiv = TRUE
  AND m.lokallag_id = 1;