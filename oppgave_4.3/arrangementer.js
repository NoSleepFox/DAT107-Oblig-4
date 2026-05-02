db.arrangementer.insertMany([
  {
    _id: 1,
    beskrivelse: "Kino for alle medlemmer i Bergen Brettspillklubb",
    dato: "2026-6-15",
    lokallag_id: 1,
    maksAntallDeltakere: 50,
    pameldingerIds: [1, 2, 3],
    møtelokale: {
      gateadresse: "Neumanns gate 3",
      postnr: "5015",
      poststed: "Bergen",
    },
    tidspunkt: "18:00",
    tittel: "Møte 2026",
  },
  {
    _id: 2,
    beskrivelse: "Møte på akvariet",
    dato: "2027-1-10",
    lokallag_id: 1,
    maksAntallDeltakere: 50,
    pameldingerIds: [3, 4, 5],
    møtelokale: {
      gateadresse: "Nordnesbakken 4",
      postnr: "5005",
      poststed: "Bergen",
    },
    tidspunkt: "16:00",
    tittel: "Møte 2027",
  },
]);
