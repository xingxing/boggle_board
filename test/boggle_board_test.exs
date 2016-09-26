defmodule BoggleBoardTest do
  use ExUnit.Case

  doctest BoggleBoard.Solver

  @boggle "RNES MOLZ KIEC EBNN"

  test "Find all words" do
    assert BoggleBoard.Solver.solve(@boggle) == ["NE", "NEON", "NEB", "NEBEK", "CEL", "CELOM", "CELS", "CEIL", "CEILS", "CLEIK", "CLON", "CLONES", "CLONE", "CLOKE", "CLINE", "ZEL", "ZELS", "ZEIN", "SELE", "SEL", "SENOR", "SEN", "SEZ", "SLORM", "SLOE", "SLIM", "NIB", "NIM", "NIE", "NIL", "NILS", "EL", "ELOIN", "ELS", "ELSE", "EN", "EIK", "EIKON", "EIKONES", "EON", "LENO", "LES", "LEZ", "LEI", "LEONES", "LEONE", "LONE", "LO", "LOIN", "LOR", "LORN", "LOKE", "LION", "LI", "LIB", "LIKE", "LIMO", "LIMN", "LIE", "LIEN", "LINE", "LINEN", "LIN", "LINN", "ENORM", "ENOKI", "ENOL", "ENOLS", "ENROL", "ENROLS", "ES", "ESLOIN", "BIO", "BI", "BIEN", "BILE", "BILES", "BINE", "BIN", "BE", "BEIN", "BEL", "BELON", "BELIE", "BELS", "BENI", "BEN", "BEZ", "BEZEL", "BEZES", "BENNI", "ION", "IO", "IKON", "IN", "INN", "INCLE", "INCLES", "ON", "ONE", "ONES", "ONLINE", "OI", "OIK", "OIL", "OILS", "OM", "OR", "OKE", "OLE", "OLES", "OLEIN", "OE", "OES", "NOIL", "NOILS", "NO", "NOM", "NORM", "NOR", "NOLES", "NOLE", "NOEL", "NOELS", "NOES", "EINE", "KEB", "KEBELE", "KEBELES", "KI", "KIBE", "KILO", "KILN", "KINE", "KIN", "KON", "KO", "KOI", "KOINE", "KOR", "KOEL", "KOELS", "MON", "MO", "MOI", "MOIL", "MOILS", "MORNE", "MORNES", "MORN", "MOR", "MOKE", "MOKI", "MOLE", "MOLES", "MOL", "MOLINE", "MOLS", "MOE", "MOES", "MI", "MIB", "MIKE", "MIEN", "MILE", "MILES", "MIL", "MILO", "MILOR", "MILS", "MINE", "MINCE", "RONE", "RONES", "ROIL", "ROILS", "ROIN", "ROM", "ROK", "ROKE", "ROLE", "ROLES", "ROE", "ROES"]
  end
end
