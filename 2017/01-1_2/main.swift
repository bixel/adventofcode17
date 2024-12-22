let input = getInput("""
  11183136235455117313495775841784971687718871633822712186999265297215465163229
  66764642852611716258928885987387219253574792494868863752797416512246866426472
  67979445939836673253446489428761486828844713816198414852769942459766921928735
  59189272361984598311728357576269475822395626258355667537953347945896415246197
  33214327688581658185494842292418696577251667696622495748894352276982714394235
  11175653875622976121749344756734658248245212273242115488961818719828258936653
  23635192429225182135238947197164195794159314115998269639622821846185575255535
  88561275821288236575481515457416634951824462814917632493745817744262258224741
  12338745629194213976328762985884127324443984163571711941113986826168921187567
  86128826874466314286786616554679562146613433354127463376986595669253915197195
  36518863811958776389193552166427318486596492632172585994566466354126234611387
  92945854536154976732167439355548965778313264824237176152196614333748919711422
  18814868729975775195529797813756193596336668274233486785489258138826313296899
  97223664953468548283168423528298279894193935948468938427461492356819219514761
  32585199265366836257322121681471877187847219712325933714149151568922456111149
  52462999593315692441846856764949472882885825429682437292921197744672969114399
  53338747524483156321852863486572933953394752567965919687174876158969599764136
  37422536563273537972841783386358764761364989261322293887361558128521915542454
  12654618285519763775311535254157897229871552238668391477796772956222939593659
  32722696612952952231131866835946785335117831874221936262345738498811858496263
  89774394351115527451886962844431947188429195191724662982411619815811652741733
  74486441166676613395195459534483717963566817784593757857511716887575418152358
  44426993841671113178751381795679391745899178945974928164766621867468375529786
  71142265114426813792549412632291424594239391853358914643327549192165466628737
  61458145818973257981491946879549341576251737222786261422491184474471169855732
  44542111235713272245542596269617419192432296886848388139125533976989372371142
  87944446722919198743189848428399356842626198635297851274879128322358195585284
  984366515428245928111112613638341345371
  """)

func filterInput(input: String) -> String {
  return input.filter { "0123456789".contains($0) }
}

func captchaSum(input: String, offsetBy: Int) -> Int {
  var sum: Int = 0
  var index = input.index(input.startIndex, offsetBy: offsetBy)

  for char in input {
    if index >= input.endIndex {
      index = input.startIndex
    }
    let number = Int(String(char))!
    let compareChar = Int(String(input[index]))
    if number == compareChar {
      sum += number
    }
    index = input.index(index, offsetBy: 1)
  }

  return sum
}

let filteredInput = filterInput(input: input)
print(captchaSum(input: filteredInput, offsetBy: 1))
print(captchaSum(input: filteredInput, offsetBy: filteredInput.count / 2))