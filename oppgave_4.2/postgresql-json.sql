SET search_path to oblig;
SELECT json_build_object(
       'lokallag_id', 1,
       'medlemmer', json_agg(
                    json_build_object(
                    'mId', m.medlemsnummer,
                    'fornavn', m.fornavn,
                    'etternavn', m.etternavn,
                    'avgift', json_build_object(
                              'ar', ma.ar,
                              'betalt', ma.betalt,
                              'betalingsdato', CASE WHEN ma.betalt = 'J'
                              THEN ma.betalingsdato::TEXT
                              END
                              )
                    )
                    ORDER BY m.medlemsnummer
                    )
       ) AS json_resultat
FROM medlem m
JOIN( SELECT DISTINCT
     ON(medlemsnummer) *
     FROM medlemsavgift
     WHERE ar = EXTRACT (YEAR FROM CURRENT_DATE)::INT
     ORDER BY medlemsnummer, betalt DESC
) ma ON ma.medlemsnummer = m.medlemsnummer
WHERE m.aktiv = TRUE
AND m.lokallag_id =1;
