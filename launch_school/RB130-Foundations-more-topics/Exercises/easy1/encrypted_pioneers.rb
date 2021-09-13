names = %w(Nqn_Ybirynpr
  Tenpr_Ubccre
  Nqryr_Tbyqfgvar
  Nyna_Ghevat
  Puneyrf_Onoontr
  Noqhyynu_Zhunzznq_ova_Zhfn_ny-Xujnevmzv
  Wbua_Ngnanfbss
  Ybvf_Unvog
  Pynhqr_Funaaba
  Fgrir_Wbof
  Ovyy_Tngrf
  Gvz_Orearef-Yrr
  Fgrir_Jbmavnx
  Xbaenq_Mhfr
  Fve_Nagbal_Ubner
  Zneiva_Zvafxl
  Lhxvuveb_Zngfhzbgb
  Unllvz_Fybavzfxv
  Tregehqr_Oynapu)

names = names.map { |name| name.split("_").join(" ")}

def rot13_decrypt(name)
  alphabets = ('a'..'z').to_a

  name.chars.map do |char|
    decrypt_char_idx = alphabets.index(char.downcase)
    decrypt_char  =
    (decrypt_char_idx ? alphabets[decrypt_char_idx - 13] : char)
    char == char.upcase ? decrypt_char.upcase : decrypt_char
  end.join
end

p names.map { |name| rot13_decrypt(name) }