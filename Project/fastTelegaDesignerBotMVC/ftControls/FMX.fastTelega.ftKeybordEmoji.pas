unit FMX.fastTelega.ftKeybordEmoji;

interface

uses
  System.Classes,
  System.SysUtils,
  FMX.Controls,
  FMX.Types,
  FMX.Layouts,
  FMX.Memo,
  FMX.Edit,
  FMX.StdCtrls;

type
  TftDictConstant = array [0 .. 1047, 0 .. 1] of String;
  TftAllDictConstant = array [0 .. 1757, 0 .. 2] of String;

  // const
  // EMOJIS_CONSTANT: TftDictConstant = ((':admission_tickets:', #$0001F39F),
  // (':aerial_tramway:', #$0001F6A1), (':airplane:', #$00002708),
  // (':airplane_arriving:', #$0001F6EC), (':airplane_departure:', #$0001F6EB),
  // (':alarm_clock:', #$000023F0), (':alembic:', #$00002697),
  // (':space_invader:', #$0001F47E), (':ambulance:', #$0001F691),
  // (':football:', #$0001F3C8), (':amphora:', #$0001F3FA),
  // (':anchor:', #$00002693), (':anger:', #$0001F4A2), (':angry:', #$0001F620),
  // (':anguished:', #$0001F627), (':ant:', #$0001F41C),
  // (':signal_strength:', #$0001F4F6), (':arrows_counterclockwise:',
  // #$0001F504), (':aquarius:', #$00002652), (':aries:', #$00002648),
  // (':arrow_heading_down:', #$00002935), (':arrow_heading_up:', #$00002934),
  // (':articulated_lorry:', #$0001F69B), (':art:', #$0001F3A8),
  // (':astonished:', #$0001F632), (':athletic_shoe:', #$0001F45F),
  // (':atom_symbol:', #$0000269B), (':eggplant:', #$0001F346),
  // (':atm:', #$0001F3E7), (':car:', #$0001F697), (':red_car:', #$0001F697),
  // (':baby:', #$0001F476), (':angel:', #$0001F47C),
  // (':baby_bottle:', #$0001F37C), (':baby_chick:', #$0001F424),
  // (':baby_symbol:', #$0001F6BC), (':back:', #$0001F519),
  // (':camel:', #$0001F42B), (':badminton_racquet_and_shuttlecock:',
  // #$0001F3F8), (':baggage_claim:', #$0001F6C4), (':balloon:', #$0001F388),
  // (':ballot_box_with_ballot:', #$0001F5F3), (':ballot_box_with_check:',
  // #$00002611), (':banana:', #$0001F34C), (':bank:', #$0001F3E6),
  // (':dollar:', #$0001F4B5), (':euro:', #$0001F4B6), (':pound:', #$0001F4B7),
  // (':yen:', #$0001F4B4), (':bar_chart:', #$0001F4CA),
  // (':barber:', #$0001F488), (':baseball:', #$000026BE),
  // (':basketball:', #$0001F3C0), (':bath:', #$0001F6C0),
  // (':bathtub:', #$0001F6C1), (':battery:', #$0001F50B),
  // (':beach_with_umbrella:', #$0001F3D6), (':bear:', #$0001F43B),
  // (':heartbeat:', #$0001F493), (':bed:', #$0001F6CF), (':beer:', #$0001F37A),
  // (':bell:', #$0001F514), (':no_bell:', #$0001F515),
  // (':bellhop_bell:', #$0001F6CE), (':bento:', #$0001F371),
  // (':bike:', #$0001F6B2), (':bicyclist:', #$0001F6B4),
  // (':bikini:', #$0001F459), (':8ball:', #$0001F3B1),
  // (':biohazard_sign:', #$00002623), (':bird:', #$0001F426),
  // (':birthday:', #$0001F382), (':black_circle_for_record:', #$000023FA),
  // (':clubs:', #$00002663), (':diamonds:', #$00002666),
  // (':arrow_double_down:', #$000023EC), (':hearts:', #$00002665),
  // (':black_large_square:', #$00002B1B), (':rewind:', #$000023EA),
  // (':black_left__pointing_double_triangle_with_vertical_bar:', #$000023EE),
  // (':arrow_backward:', #$000025C0), (':black_medium_small_square:',
  // #$000025FE), (':black_medium_square:', #$000025FC),
  // (':black_nib:', #$00002712), (':question:', #$00002753),
  // (':fast_forward:', #$000023E9),
  // (':black_right__pointing_double_triangle_with_vertical_bar:', #$000023ED),
  // (':arrow_forward:', #$000025B6),
  // (':black_right__pointing_triangle_with_double_vertical_bar:', #$000023EF),
  // (':arrow_right:', #$000027A1), (':scissors:', #$00002702),
  // (':black_small_square:', #$000025AA), (':spades:', #$00002660),
  // (':black_square_button:', #$0001F532), (':black_square_for_stop:',
  // #$000023F9), (':sunny:', #$00002600), (':phone:', #$0000260E),
  // (':telephone:', #$0000260E), (':recycle:', #$0000267B),
  // (':arrow_double_up:', #$000023EB), (':blossom:', #$0001F33C),
  // (':blowfish:', #$0001F421), (':blue_book:', #$0001F4D8),
  // (':blue_heart:', #$0001F499), (':boar:', #$0001F417),
  // (':bomb:', #$0001F4A3), (':bookmark:', #$0001F516),
  // (':bookmark_tabs:', #$0001F4D1), (':books:', #$0001F4DA),
  // (':bottle_with_popping_cork:', #$0001F37E), (':bouquet:', #$0001F490),
  // (':bow_and_arrow:', #$0001F3F9), (':bowling:', #$0001F3B3),
  // (':boy:', #$0001F466), (':bread:', #$0001F35E),
  // (':bride_with_veil:', #$0001F470), (':bridge_at_night:', #$0001F309),
  // (':briefcase:', #$0001F4BC), (':broken_heart:', #$0001F494),
  // (':bug:', #$0001F41B), (':building_construction:', #$0001F3D7),
  // (':burrito:', #$0001F32F), (':bus:', #$0001F68C), (':busstop:', #$0001F68F),
  // (':bust_in_silhouette:', #$0001F464), (':busts_in_silhouette:', #$0001F465),
  // (':cactus:', #$0001F335), (':date:', #$0001F4C5), (':camera:', #$0001F4F7),
  // (':camera_with_flash:', #$0001F4F8), (':camping:', #$0001F3D5),
  // (':cancer:', #$0000264B), (':candle:', #$0001F56F), (':candy:', #$0001F36C),
  // (':capricorn:', #$00002651), (':card_file_box:', #$0001F5C3),
  // (':card_index:', #$0001F4C7), (':card_index_dividers:', #$0001F5C2),
  // (':carousel_horse:', #$0001F3A0), (':flags:', #$0001F38F),
  // (':flag_for_sri_lanka:', #$0001F1F1 + #$0001F1F0),
  // (':flag_for_india:', #$0001F1EE + #$0001F1F3), (':cat2:', #$0001F408),
  // (':cat:', #$0001F431), (':joy_cat:', #$0001F639),
  // (':smirk_cat:', #$0001F63C), (':chains:', #$000026D3),
  // (':chart_with_downwards_trend:', #$0001F4C9), (':chart_with_upwards_trend:',
  // #$0001F4C8), (':chart:', #$0001F4B9), (':mega:', #$0001F4E3),
  // (':cheese_wedge:', #$0001F9C0), (':checkered_flag:', #$0001F3C1),
  // (':cherries:', #$0001F352), (':cherry_blossom:', #$0001F338),
  // (':chestnut:', #$0001F330), (':chicken:', #$0001F414),
  // (':children_crossing:', #$0001F6B8), (':chipmunk:', #$0001F43F),
  // (':chocolate_bar:', #$0001F36B), (':christmas_tree:', #$0001F384),
  // (':church:', #$000026EA), (':cinema:', #$0001F3A6),
  // (':accept:', #$0001F251), (':ideograph_advantage:', #$0001F250),
  // (':congratulations:', #$00003297), (':secret:', #$00003299),
  // (':m:', #$000024C2), (':circus_tent:', #$0001F3AA),
  // (':cityscape:', #$0001F3D9), (':city_sunset:', #$0001F306),
  // (':clapper:', #$0001F3AC), (':clap:', #$0001F44F),
  // (':classical_building:', #$0001F3DB), (':beers:', #$0001F37B),
  // (':clipboard:', #$0001F4CB), (':clock830:', #$0001F563),
  // (':clock8:', #$0001F557), (':clock1130:', #$0001F566),
  // (':clock11:', #$0001F55A), (':clock530:', #$0001F560),
  // (':clock5:', #$0001F554), (':clock430:', #$0001F55F),
  // (':clock4:', #$0001F553), (':clock930:', #$0001F564),
  // (':clock9:', #$0001F558), (':clock130:', #$0001F55C),
  // (':clock1:', #$0001F550), (':clock730:', #$0001F562),
  // (':clock7:', #$0001F556), (':clock630:', #$0001F561),
  // (':clock6:', #$0001F555), (':clock1030:', #$0001F565),
  // (':clock10:', #$0001F559), (':clock330:', #$0001F55E),
  // (':clock3:', #$0001F552), (':clock1230:', #$0001F567),
  // (':clock12:', #$0001F55B), (':clock230:', #$0001F55D),
  // (':clock2:', #$0001F551), (':arrows_clockwise:', #$0001F503),
  // (':repeat:', #$0001F501), (':repeat_one:', #$0001F502),
  // (':closed_book:', #$0001F4D5), (':closed_lock_with_key:', #$0001F510),
  // (':mailbox_closed:', #$0001F4EA), (':mailbox:', #$0001F4EB),
  // (':closed_umbrella:', #$0001F302), (':cloud:', #$00002601),
  // (':cloud_with_lightning:', #$0001F329), (':cloud_with_rain:', #$0001F327),
  // (':cloud_with_snow:', #$0001F328), (':cloud_with_tornado:', #$0001F32A),
  // (':cocktail:', #$0001F378), (':coffin:', #$000026B0),
  // (':boom:', #$0001F4A5), (':collision:', #$0001F4A5),
  // (':comet:', #$00002604), (':compression:', #$0001F5DC),
  // (':confetti_ball:', #$0001F38A), (':confounded:', #$0001F616),
  // (':confused:', #$0001F615), (':construction:', #$0001F6A7),
  // (':construction_worker:', #$0001F477), (':control_knobs:', #$0001F39B),
  // (':convenience_store:', #$0001F3EA), (':rice:', #$0001F35A),
  // (':cookie:', #$0001F36A), (':egg:', #$0001F373),
  // (':copyright:', #$000000A9), (':couch_and_lamp:', #$0001F6CB),
  // (':couple_with_heart:', #$0001F491), (':cow2:', #$0001F404),
  // (':cow:', #$0001F42E), (':crab:', #$0001F980),
  // (':credit_card:', #$0001F4B3), (':crescent_moon:', #$0001F319),
  // (':cricket_bat_and_ball:', #$0001F3CF), (':crocodile:', #$0001F40A),
  // (':x:', #$0000274C), (':crossed_flags:', #$0001F38C),
  // (':crossed_swords:', #$00002694), (':crown:', #$0001F451),
  // (':crying_cat_face:', #$0001F63F), (':cry:', #$0001F622),
  // (':crystal_ball:', #$0001F52E), (':curly_loop:', #$000027B0),
  // (':currency_exchange:', #$0001F4B1), (':curry:', #$0001F35B),
  // (':custard:', #$0001F36E), (':customs:', #$0001F6C3),
  // (':cyclone:', #$0001F300), (':dagger_knife:', #$0001F5E1),
  // (':dancer:', #$0001F483), (':dango:', #$0001F361),
  // (':dark_sunglasses:', #$0001F576), (':dash:', #$0001F4A8),
  // (':deciduous_tree:', #$0001F333), (':truck:', #$0001F69A),
  // (':department_store:', #$0001F3EC), (':derelict_house_building:',
  // #$0001F3DA), (':desert:', #$0001F3DC), (':desert_island:', #$0001F3DD),
  // (':desktop_computer:', #$0001F5A5), (':diamond_shape_with_a_dot_inside:',
  // #$0001F4A0), (':dart:', #$0001F3AF), (':disappointed_relieved:',
  // #$0001F625), (':disappointed:', #$0001F61E), (':dizzy_face:', #$0001F635),
  // (':dizzy:', #$0001F4AB), (':do_not_litter:', #$0001F6AF),
  // (':dog2:', #$0001F415), (':dog:', #$0001F436), (':dolphin:', #$0001F42C),
  // (':flipper:', #$0001F42C), (':door:', #$0001F6AA), (':loop:', #$000027BF),
  // (':bangbang:', #$0000203C), (':double_vertical_bar:', #$000023F8),
  // (':doughnut:', #$0001F369), (':dove_of_peace:', #$0001F54A),
  // (':small_red_triangle_down:', #$0001F53B),
  // (':arrow_down_small:', #$0001F53D), (':arrow_down:', #$00002B07),
  // (':dragon:', #$0001F409), (':dragon_face:', #$0001F432),
  // (':dress:', #$0001F457), (':dromedary_camel:', #$0001F42A),
  // (':droplet:', #$0001F4A7), (':dvd:', #$0001F4C0), (':e__mail:', #$0001F4E7),
  // (':ear:', #$0001F442), (':corn:', #$0001F33D),
  // (':ear_of_rice:', #$0001F33E), (':earth_americas:', #$0001F30E),
  // (':earth_asia:', #$0001F30F), (':earth_africa:', #$0001F30D),
  // (':eight_pointed_black_star:', #$00002734), (':eight_spoked_asterisk:',
  // #$00002733), (':eject_symbol:', #$000023CF), (':bulb:', #$0001F4A1),
  // (':electric_plug:', #$0001F50C), (':flashlight:', #$0001F526),
  // (':elephant:', #$0001F418), (':emoji_modifier_fitzpatrick_type__1__2:',
  // #$0001F3FB), (':emoji_modifier_fitzpatrick_type__3:', #$0001F3FC),
  // (':emoji_modifier_fitzpatrick_type__4:', #$0001F3FD),
  // (':emoji_modifier_fitzpatrick_type__5:', #$0001F3FE),
  // (':emoji_modifier_fitzpatrick_type__6:', #$0001F3FF), (':end:', #$0001F51A),
  // (':email:', #$00002709), (':envelope:', #$00002709),
  // (':envelope_with_arrow:', #$0001F4E9), (':european_castle:', #$0001F3F0),
  // (':european_post_office:', #$0001F3E4), (':evergreen_tree:', #$0001F332),
  // (':interrobang:', #$00002049), (':expressionless:', #$0001F611),
  // (':alien:', #$0001F47D), (':eye:', #$0001F441),
  // (':eyeglasses:', #$0001F453), (':eyes:', #$0001F440),
  // (':massage:', #$0001F486), (':yum:', #$0001F60B), (':scream:', #$0001F631),
  // (':kissing_heart:', #$0001F618), (':sweat:', #$0001F613),
  // (':face_with_head__bandage:', #$0001F915), (':triumph:', #$0001F624),
  // (':mask:', #$0001F637), (':no_good:', #$0001F645),
  // (':ok_woman:', #$0001F646), (':open_mouth:', #$0001F62E),
  // (':cold_sweat:', #$0001F630), (':face_with_rolling_eyes:', #$0001F644),
  // (':stuck_out_tongue:', #$0001F61B), (':stuck_out_tongue_closed_eyes:',
  // #$0001F61D), (':stuck_out_tongue_winking_eye:', #$0001F61C),
  // (':joy:', #$0001F602), (':face_with_thermometer:', #$0001F912),
  // (':no_mouth:', #$0001F636), (':factory:', #$0001F3ED),
  // (':fallen_leaf:', #$0001F342), (':family:', #$0001F46A),
  // (':santa:', #$0001F385), (':fax:', #$0001F4E0), (':fearful:', #$0001F628),
  // (':ferris_wheel:', #$0001F3A1), (':ferry:', #$000026F4),
  // (':field_hockey_stick_and_ball:', #$0001F3D1),
  // (':file_cabinet:', #$0001F5C4), (':file_folder:', #$0001F4C1),
  // (':film_frames:', #$0001F39E), (':film_projector:', #$0001F4FD),
  // (':fire:', #$0001F525), (':fire_engine:', #$0001F692),
  // (':sparkler:', #$0001F387), (':fireworks:', #$0001F386),
  // (':first_quarter_moon:', #$0001F313), (':first_quarter_moon_with_face:',
  // #$0001F31B), (':fish:', #$0001F41F), (':fish_cake:', #$0001F365),
  // (':fishing_pole_and_fish:', #$0001F3A3), (':facepunch:', #$0001F44A),
  // (':punch:', #$0001F44A), (':golf:', #$000026F3),
  // (':fleur__de__lis:', #$0000269C), (':muscle:', #$0001F4AA),
  // (':floppy_disk:', #$0001F4BE), (':flower_playing_cards:', #$0001F3B4),
  // (':flushed:', #$0001F633), (':fog:', #$0001F32B), (':foggy:', #$0001F301),
  // (':footprints:', #$0001F463), (':fork_and_knife:', #$0001F374),
  // (':fork_and_knife_with_plate:', #$0001F37D), (':fountain:', #$000026F2),
  // (':four_leaf_clover:', #$0001F340), (':frame_with_picture:', #$0001F5BC),
  // (':fries:', #$0001F35F), (':fried_shrimp:', #$0001F364),
  // (':frog:', #$0001F438), (':hatched_chick:', #$0001F425),
  // (':frowning:', #$0001F626), (':fuelpump:', #$000026FD),
  // (':full_moon:', #$0001F315), (':full_moon_with_face:', #$0001F31D),
  // (':funeral_urn:', #$000026B1), (':game_die:', #$0001F3B2),
  // (':gear:', #$00002699), (':gem:', #$0001F48E), (':gemini:', #$0000264A),
  // (':ghost:', #$0001F47B), (':girl:', #$0001F467), (':globe_with_meridians:',
  // #$0001F310), (':star2:', #$0001F31F), (':goat:', #$0001F410),
  // (':golfer:', #$0001F3CC), (':mortar_board:', #$0001F393),
  // (':grapes:', #$0001F347), (':green_apple:', #$0001F34F),
  // (':green_book:', #$0001F4D7), (':green_heart:', #$0001F49A),
  // (':grimacing:', #$0001F62C), (':smile_cat:', #$0001F638),
  // (':grinning:', #$0001F600), (':grin:', #$0001F601),
  // (':heartpulse:', #$0001F497), (':guardsman:', #$0001F482),
  // (':guitar:', #$0001F3B8), (':haircut:', #$0001F487),
  // (':hamburger:', #$0001F354), (':hammer:', #$0001F528),
  // (':hammer_and_pick:', #$00002692), (':hammer_and_wrench:', #$0001F6E0),
  // (':hamster:', #$0001F439), (':handbag:', #$0001F45C),
  // (':raising_hand:', #$0001F64B), (':hatching_chick:', #$0001F423),
  // (':headphones:', #$0001F3A7), (':hear_no_evil:', #$0001F649),
  // (':heart_decoration:', #$0001F49F), (':cupid:', #$0001F498),
  // (':gift_heart:', #$0001F49D), (':heart:', #$00002764),
  // (':heavy_check_mark:', #$00002714), (':heavy_division_sign:', #$00002797),
  // (':heavy_dollar_sign:', #$0001F4B2), (':exclamation:', #$00002757),
  // (':heavy_exclamation_mark:', #$00002757),
  // (':heavy_heart_exclamation_mark_ornament:', #$00002763),
  // (':o:', #$00002B55), (':heavy_minus_sign:', #$00002796),
  // (':heavy_multiplication_x:', #$00002716), (':heavy_plus_sign:', #$00002795),
  // (':helicopter:', #$0001F681), (':helm_symbol:', #$00002388),
  // (':helmet_with_white_cross:', #$000026D1), (':herb:', #$0001F33F),
  // (':hibiscus:', #$0001F33A), (':high_heel:', #$0001F460),
  // (':bullettrain_side:', #$0001F684), (':bullettrain_front:', #$0001F685),
  // (':high_brightness:', #$0001F506), (':zap:', #$000026A1),
  // (':hocho:', #$0001F52A), (':knife:', #$0001F52A), (':hole:', #$0001F573),
  // (':honey_pot:', #$0001F36F), (':bee:', #$0001F41D),
  // (':traffic_light:', #$0001F6A5), (':racehorse:', #$0001F40E),
  // (':horse:', #$0001F434), (':horse_racing:', #$0001F3C7),
  // (':hospital:', #$0001F3E5), (':coffee:', #$00002615),
  // (':hot_dog:', #$0001F32D), (':hot_pepper:', #$0001F336),
  // (':hotsprings:', #$00002668), (':hotel:', #$0001F3E8),
  // (':hourglass:', #$0000231B), (':hourglass_flowing_sand:', #$000023F3),
  // (':house:', #$0001F3E0), (':house_buildings:', #$0001F3D8),
  // (':house_with_garden:', #$0001F3E1), (':hugging_face:', #$0001F917),
  // (':100:', #$0001F4AF), (':hushed:', #$0001F62F),
  // (':ice_cream:', #$0001F368), (':ice_hockey_stick_and_puck:', #$0001F3D2),
  // (':ice_skate:', #$000026F8), (':imp:', #$0001F47F),
  // (':inbox_tray:', #$0001F4E5), (':incoming_envelope:', #$0001F4E8),
  // (':information_desk_person:', #$0001F481), (':information_source:',
  // #$00002139), (':capital_abcd:', #$0001F520), (':abc:', #$0001F524),
  // (':abcd:', #$0001F521), (':1234:', #$0001F522), (':symbols:', #$0001F523),
  // (':izakaya_lantern:', #$0001F3EE), (':lantern:', #$0001F3EE),
  // (':jack_o_lantern:', #$0001F383), (':japanese_castle:', #$0001F3EF),
  // (':dolls:', #$0001F38E), (':japanese_goblin:', #$0001F47A),
  // (':japanese_ogre:', #$0001F479), (':post_office:', #$0001F3E3),
  // (':beginner:', #$0001F530), (':jeans:', #$0001F456),
  // (':joystick:', #$0001F579), (':kaaba:', #$0001F54B), (':key:', #$0001F511),
  // (':keyboard:', #$00002328), (':keycap_asterisk:', #$0000002A + #$000020E3),
  // (':keycap_digit_eight:', #$00000038 + #$000020E3),
  // (':keycap_digit_five:', #$00000035 + #$000020E3),
  // (':keycap_digit_four:', #$00000034 + #$000020E3),
  // (':keycap_digit_nine:', #$00000039 + #$000020E3),
  // (':keycap_digit_one:', #$00000031 + #$000020E3),
  // (':keycap_digit_seven:', #$00000037 + #$000020E3),
  // (':keycap_digit_six:', #$00000036 + #$000020E3),
  // (':keycap_digit_three:', #$00000033 + #$000020E3),
  // (':keycap_digit_two:', #$00000032 + #$000020E3),
  // (':keycap_digit_zero:', #$00000030 + #$000020E3),
  // (':keycap_number_sign:', #$00000023 + #$000020E3),
  // (':keycap_ten:', #$0001F51F), (':kimono:', #$0001F458),
  // (':couplekiss:', #$0001F48F), (':kiss:', #$0001F48B),
  // (':kissing_cat:', #$0001F63D), (':kissing:', #$0001F617),
  // (':kissing_closed_eyes:', #$0001F61A), (':kissing_smiling_eyes:',
  // #$0001F619), (':koala:', #$0001F428), (':label:', #$0001F3F7),
  // (':beetle:', #$0001F41E), (':large_blue_circle:', #$0001F535),
  // (':large_blue_diamond:', #$0001F537), (':large_orange_diamond:',
  // #$0001F536), (':red_circle:', #$0001F534), (':last_quarter_moon:',
  // #$0001F317), (':last_quarter_moon_with_face:', #$0001F31C),
  // (':latin_cross:', #$0000271D), (':leaves:', #$0001F343),
  // (':ledger:', #$0001F4D2), (':mag:', #$0001F50D),
  // (':left_luggage:', #$0001F6C5), (':left_right_arrow:', #$00002194),
  // (':leftwards_arrow_with_hook:', #$000021A9), (':arrow_left:', #$00002B05),
  // (':lemon:', #$0001F34B), (':leo:', #$0000264C), (':leopard:', #$0001F406),
  // (':level_slider:', #$0001F39A), (':libra:', #$0000264E),
  // (':light_rail:', #$0001F688), (':link:', #$0001F517),
  // (':linked_paperclips:', #$0001F587), (':lion_face:', #$0001F981),
  // (':lipstick:', #$0001F484), (':lock:', #$0001F512),
  // (':lock_with_ink_pen:', #$0001F50F), (':lollipop:', #$0001F36D),
  // (':sob:', #$0001F62D), (':love_hotel:', #$0001F3E9),
  // (':love_letter:', #$0001F48C), (':low_brightness:', #$0001F505),
  // (':lower_left_ballpoint_pen:', #$0001F58A),
  // (':lower_left_crayon:', #$0001F58D), (':lower_left_fountain_pen:',
  // #$0001F58B), (':lower_left_paintbrush:', #$0001F58C),
  // (':mahjong:', #$0001F004), (':man:', #$0001F468), (':couple:', #$0001F46B),
  // (':man_in_business_suit_levitating:', #$0001F574),
  // (':man_with_gua_pi_mao:', #$0001F472), (':man_with_turban:', #$0001F473),
  // (':mans_shoe:', #$0001F45E), (':shoe:', #$0001F45E),
  // (':mantelpiece_clock:', #$0001F570), (':maple_leaf:', #$0001F341),
  // (':meat_on_bone:', #$0001F356), (':black_circle:', #$000026AB),
  // (':white_circle:', #$000026AA), (':melon:', #$0001F348),
  // (':memo:', #$0001F4DD), (':pencil:', #$0001F4DD),
  // (':menorah_with_nine_branches:', #$0001F54E), (':mens:', #$0001F6B9),
  // (':metro:', #$0001F687), (':microphone:', #$0001F3A4),
  // (':microscope:', #$0001F52C), (':military_medal:', #$0001F396),
  // (':milky_way:', #$0001F30C), (':minibus:', #$0001F690),
  // (':minidisc:', #$0001F4BD), (':iphone:', #$0001F4F1),
  // (':mobile_phone_off:', #$0001F4F4), (':calling:', #$0001F4F2),
  // (':money__mouth_face:', #$0001F911), (':moneybag:', #$0001F4B0),
  // (':money_with_wings:', #$0001F4B8), (':monkey:', #$0001F412),
  // (':monkey_face:', #$0001F435), (':monorail:', #$0001F69D),
  // (':rice_scene:', #$0001F391), (':mosque:', #$0001F54C),
  // (':motor_boat:', #$0001F6E5), (':motorway:', #$0001F6E3),
  // (':mount_fuji:', #$0001F5FB), (':mountain:', #$000026F0),
  // (':mountain_bicyclist:', #$0001F6B5), (':mountain_cableway:', #$0001F6A0),
  // (':mountain_railway:', #$0001F69E), (':mouse2:', #$0001F401),
  // (':mouse:', #$0001F42D), (':lips:', #$0001F444),
  // (':movie_camera:', #$0001F3A5), (':moyai:', #$0001F5FF),
  // (':notes:', #$0001F3B6), (':mushroom:', #$0001F344),
  // (':musical_keyboard:', #$0001F3B9), (':musical_note:', #$0001F3B5),
  // (':musical_score:', #$0001F3BC), (':nail_care:', #$0001F485),
  // (':name_badge:', #$0001F4DB), (':national_park:', #$0001F3DE),
  // (':necktie:', #$0001F454), (':ab:', #$0001F18E),
  // (':negative_squared_cross_mark:', #$0000274E), (':a:', #$0001F170),
  // (':b:', #$0001F171), (':o2:', #$0001F17E), (':parking:', #$0001F17F),
  // (':nerd_face:', #$0001F913), (':neutral_face:', #$0001F610),
  // (':new_moon:', #$0001F311), (':honeybee:', #$0001F41D),
  // (':new_moon_with_face:', #$0001F31A), (':newspaper:', #$0001F4F0),
  // (':night_with_stars:', #$0001F303), (':no_bicycles:', #$0001F6B3),
  // (':no_entry:', #$000026D4), (':no_entry_sign:', #$0001F6AB),
  // (':no_mobile_phones:', #$0001F4F5), (':underage:', #$0001F51E),
  // (':no_pedestrians:', #$0001F6B7), (':no_smoking:', #$0001F6AD),
  // (':non__potable_water:', #$0001F6B1), (':arrow_upper_right:', #$00002197),
  // (':arrow_upper_left:', #$00002196), (':nose:', #$0001F443),
  // (':notebook:', #$0001F4D3), (':notebook_with_decorative_cover:',
  // #$0001F4D4), (':nut_and_bolt:', #$0001F529), (':octopus:', #$0001F419),
  // (':oden:', #$0001F362), (':office:', #$0001F3E2),
  // (':oil_drum:', #$0001F6E2), (':ok_hand:', #$0001F44C),
  // (':old_key:', #$0001F5DD), (':older_man:', #$0001F474),
  // (':older_woman:', #$0001F475), (':om_symbol:', #$0001F549),
  // (':on:', #$0001F51B), (':oncoming_automobile:', #$0001F698),
  // (':oncoming_bus:', #$0001F68D), (':oncoming_police_car:', #$0001F694),
  // (':oncoming_taxi:', #$0001F696), (':book:', #$0001F4D6),
  // (':open_book:', #$0001F4D6), (':open_file_folder:', #$0001F4C2),
  // (':open_hands:', #$0001F450), (':unlock:', #$0001F513),
  // (':mailbox_with_no_mail:', #$0001F4ED), (':mailbox_with_mail:', #$0001F4EC),
  // (':ophiuchus:', #$000026CE), (':cd:', #$0001F4BF),
  // (':orange_book:', #$0001F4D9), (':orthodox_cross:', #$00002626),
  // (':outbox_tray:', #$0001F4E4), (':ox:', #$0001F402),
  // (':package:', #$0001F4E6), (':page_facing_up:', #$0001F4C4),
  // (':page_with_curl:', #$0001F4C3), (':pager:', #$0001F4DF),
  // (':palm_tree:', #$0001F334), (':panda_face:', #$0001F43C),
  // (':paperclip:', #$0001F4CE), (':part_alternation_mark:', #$0000303D),
  // (':tada:', #$0001F389), (':passenger_ship:', #$0001F6F3),
  // (':passport_control:', #$0001F6C2), (':feet:', #$0001F43E),
  // (':paw_prints:', #$0001F43E), (':peace_symbol:', #$0000262E),
  // (':peach:', #$0001F351), (':pear:', #$0001F350), (':walking:', #$0001F6B6),
  // (':pencil2:', #$0000270F), (':penguin:', #$0001F427),
  // (':pensive:', #$0001F614), (':performing_arts:', #$0001F3AD),
  // (':persevere:', #$0001F623), (':bow:', #$0001F647),
  // (':person_frowning:', #$0001F64D), (':raised_hands:', #$0001F64C),
  // (':person_with_ball:', #$000026F9), (':person_with_blond_hair:',
  // #$0001F471), (':pray:', #$0001F64F), (':computer:', #$0001F4BB),
  // (':pick:', #$000026CF), (':pig2:', #$0001F416), (':pig:', #$0001F437),
  // (':pig_nose:', #$0001F43D), (':hankey:', #$0001F4A9),
  // (':poop:', #$0001F4A9), (':shit:', #$0001F4A9), (':pill:', #$0001F48A),
  // (':bamboo:', #$0001F38D), (':pineapple:', #$0001F34D),
  // (':pisces:', #$00002653), (':gun:', #$0001F52B),
  // (':place_of_worship:', #$0001F6D0), (':black_joker:', #$0001F0CF),
  // (':police_car:', #$0001F693), (':rotating_light:', #$0001F6A8),
  // (':cop:', #$0001F46E), (':poodle:', #$0001F429), (':popcorn:', #$0001F37F),
  // (':postal_horn:', #$0001F4EF), (':postbox:', #$0001F4EE),
  // (':stew:', #$0001F372), (':potable_water:', #$0001F6B0),
  // (':pouch:', #$0001F45D), (':poultry_leg:', #$0001F357),
  // (':pouting_cat:', #$0001F63E), (':rage:', #$0001F621),
  // (':prayer_beads:', #$0001F4FF), (':princess:', #$0001F478),
  // (':printer:', #$0001F5A8), (':loudspeaker:', #$0001F4E2),
  // (':purple_heart:', #$0001F49C), (':purse:', #$0001F45B),
  // (':pushpin:', #$0001F4CC), (':put_litter_in_its_place:', #$0001F6AE),
  // (':rabbit2:', #$0001F407), (':rabbit:', #$0001F430),
  // (':racing_car:', #$0001F3CE), (':racing_motorcycle:', #$0001F3CD),
  // (':radio:', #$0001F4FB), (':radio_button:', #$0001F518),
  // (':radioactive_sign:', #$00002622), (':railway_car:', #$0001F683),
  // (':railway_track:', #$0001F6E4), (':rainbow:', #$0001F308),
  // (':fist:', #$0000270A), (':hand:', #$0000270B),
  // (':raised_hand:', #$0000270B), (':raised_hand_with_fingers_splayed:',
  // #$0001F590), (':raised_hand_with_part_between_middle_and_ring_fingers:',
  // #$0001F596), (':ram:', #$0001F40F), (':rat:', #$0001F400),
  // (':blue_car:', #$0001F699), (':apple:', #$0001F34E),
  // (':registered:', #$000000AE), (':relieved:', #$0001F60C),
  // (':reminder_ribbon:', #$0001F397), (':restroom:', #$0001F6BB),
  // (':reversed_hand_with_middle_finger_extended:', #$0001F595),
  // (':revolving_hearts:', #$0001F49E), (':ribbon:', #$0001F380),
  // (':rice_ball:', #$0001F359), (':rice_cracker:', #$0001F358),
  // (':mag_right:', #$0001F50E), (':right_anger_bubble:', #$0001F5EF),
  // (':arrow_right_hook:', #$000021AA), (':ring:', #$0001F48D),
  // (':sweet_potato:', #$0001F360), (':robot_face:', #$0001F916),
  // (':rocket:', #$0001F680), (':rolled__up_newspaper:', #$0001F5DE),
  // (':roller_coaster:', #$0001F3A2), (':rooster:', #$0001F413),
  // (':rose:', #$0001F339), (':rosette:', #$0001F3F5),
  // (':round_pushpin:', #$0001F4CD), (':rowboat:', #$0001F6A3),
  // (':rugby_football:', #$0001F3C9), (':runner:', #$0001F3C3),
  // (':running:', #$0001F3C3), (':running_shirt_with_sash:', #$0001F3BD),
  // (':sagittarius:', #$00002650), (':boat:', #$000026F5),
  // (':sailboat:', #$000026F5), (':sake:', #$0001F376),
  // (':satellite:', #$0001F4E1), (':saxophone:', #$0001F3B7),
  // (':scales:', #$00002696), (':school:', #$0001F3EB),
  // (':school_satchel:', #$0001F392), (':scorpion:', #$0001F982),
  // (':scorpius:', #$0000264F), (':scroll:', #$0001F4DC),
  // (':seat:', #$0001F4BA), (':see_no_evil:', #$0001F648),
  // (':seedling:', #$0001F331), (':shamrock:', #$00002618),
  // (':shaved_ice:', #$0001F367), (':sheep:', #$0001F411),
  // (':shield:', #$0001F6E1), (':shinto_shrine:', #$000026E9),
  // (':ship:', #$0001F6A2), (':stars:', #$0001F320),
  // (':shopping_bags:', #$0001F6CD), (':cake:', #$0001F370),
  // (':shower:', #$0001F6BF), (':sign_of_the_horns:', #$0001F918),
  // (':japan:', #$0001F5FE), (':six_pointed_star:', #$0001F52F),
  // (':ski:', #$0001F3BF), (':skier:', #$000026F7), (':skull:', #$0001F480),
  // (':skull_and_crossbones:', #$00002620), (':sleeping_accommodation:',
  // #$0001F6CC), (':sleeping:', #$0001F634), (':zzz:', #$0001F4A4),
  // (':sleepy:', #$0001F62A), (':sleuth_or_spy:', #$0001F575),
  // (':pizza:', #$0001F355), (':slightly_frowning_face:', #$0001F641),
  // (':slightly_smiling_face:', #$0001F642), (':slot_machine:', #$0001F3B0),
  // (':small_airplane:', #$0001F6E9), (':small_blue_diamond:', #$0001F539),
  // (':small_orange_diamond:', #$0001F538), (':heart_eyes_cat:', #$0001F63B),
  // (':smiley_cat:', #$0001F63A), (':innocent:', #$0001F607),
  // (':heart_eyes:', #$0001F60D), (':smiling_imp:', #$0001F608),
  // (':smiley:', #$0001F603), (':sweat_smile:', #$0001F605),
  // (':smile:', #$0001F604), (':laughing:', #$0001F606),
  // (':satisfied:', #$0001F606), (':blush:', #$0001F60A),
  // (':sunglasses:', #$0001F60E), (':smirk:', #$0001F60F),
  // (':smoking:', #$0001F6AC), (':snail:', #$0001F40C), (':snake:', #$0001F40D),
  // (':snow_capped_mountain:', #$0001F3D4), (':snowboarder:', #$0001F3C2),
  // (':snowflake:', #$00002744), (':snowman:', #$00002603),
  // (':soccer:', #$000026BD), (':icecream:', #$0001F366),
  // (':soon:', #$0001F51C), (':arrow_lower_right:', #$00002198),
  // (':arrow_lower_left:', #$00002199), (':spaghetti:', #$0001F35D),
  // (':sparkle:', #$00002747), (':sparkles:', #$00002728),
  // (':sparkling_heart:', #$0001F496), (':speak_no_evil:', #$0001F64A),
  // (':speaker:', #$0001F508), (':mute:', #$0001F507), (':sound:', #$0001F509),
  // (':loud_sound:', #$0001F50A), (':speaking_head_in_silhouette:', #$0001F5E3),
  // (':speech_balloon:', #$0001F4AC), (':speedboat:', #$0001F6A4),
  // (':spider:', #$0001F577), (':spider_web:', #$0001F578),
  // (':spiral_calendar_pad:', #$0001F5D3), (':spiral_note_pad:', #$0001F5D2),
  // (':shell:', #$0001F41A), (':sweat_drops:', #$0001F4A6),
  // (':sports_medal:', #$0001F3C5), (':whale:', #$0001F433),
  // (':u5272:', #$0001F239), (':u5408:', #$0001F234), (':u55b6:', #$0001F23A),
  // (':u6307:', #$0001F22F), (':u6708:', #$0001F237), (':u6709:', #$0001F236),
  // (':u6e80:', #$0001F235), (':u7121:', #$0001F21A), (':u7533:', #$0001F238),
  // (':u7981:', #$0001F232), (':u7a7a:', #$0001F233), (':cl:', #$0001F191),
  // (':cool:', #$0001F192), (':free:', #$0001F193), (':id:', #$0001F194),
  // (':koko:', #$0001F201), (':sa:', #$0001F202), (':new:', #$0001F195),
  // (':ng:', #$0001F196), (':ok:', #$0001F197), (':sos:', #$0001F198),
  // (':up:', #$0001F199), (':vs:', #$0001F19A), (':stadium:', #$0001F3DF),
  // (':star_and_crescent:', #$0000262A), (':star_of_david:', #$00002721),
  // (':station:', #$0001F689), (':statue_of_liberty:', #$0001F5FD),
  // (':steam_locomotive:', #$0001F682), (':ramen:', #$0001F35C),
  // (':stopwatch:', #$000023F1), (':straight_ruler:', #$0001F4CF),
  // (':strawberry:', #$0001F353), (':studio_microphone:', #$0001F399),
  // (':partly_sunny:', #$000026C5), (':sun_with_face:', #$0001F31E),
  // (':sunflower:', #$0001F33B), (':sunrise:', #$0001F305),
  // (':sunrise_over_mountains:', #$0001F304), (':city_sunrise:', #$0001F307),
  // (':surfer:', #$0001F3C4), (':sushi:', #$0001F363),
  // (':suspension_railway:', #$0001F69F), (':swimmer:', #$0001F3CA),
  // (':synagogue:', #$0001F54D), (':syringe:', #$0001F489),
  // (':shirt:', #$0001F455), (':tshirt:', #$0001F455),
  // (':table_tennis_paddle_and_ball:', #$0001F3D3), (':taco:', #$0001F32E),
  // (':tanabata_tree:', #$0001F38B), (':tangerine:', #$0001F34A),
  // (':taurus:', #$00002649), (':taxi:', #$0001F695), (':tea:', #$0001F375),
  // (':calendar:', #$0001F4C6), (':telephone_receiver:', #$0001F4DE),
  // (':telescope:', #$0001F52D), (':tv:', #$0001F4FA), (':tennis:', #$0001F3BE),
  // (':tent:', #$000026FA), (':thermometer:', #$0001F321),
  // (':thinking_face:', #$0001F914), (':thought_balloon:', #$0001F4AD),
  // (':three_button_mouse:', #$0001F5B1), (':+1:', #$0001F44D),
  // (':thumbsup:', #$0001F44D), (':__1:', #$0001F44E), (':-1:', #$0001F44E),
  // (':thumbsdown:', #$0001F44E), (':thunder_cloud_and_rain:', #$000026C8),
  // (':ticket:', #$0001F3AB), (':tiger2:', #$0001F405), (':tiger:', #$0001F42F),
  // (':timer_clock:', #$000023F2), (':tired_face:', #$0001F62B),
  // (':toilet:', #$0001F6BD), (':tokyo_tower:', #$0001F5FC),
  // (':tomato:', #$0001F345), (':tongue:', #$0001F445),
  // (':tophat:', #$0001F3A9), (':top:', #$0001F51D),
  // (':trackball:', #$0001F5B2), (':tractor:', #$0001F69C),
  // (':tm:', #$00002122), (':train2:', #$0001F686), (':tram:', #$0001F68A),
  // (':train:', #$0001F68B), (':triangular_flag_on_post:', #$0001F6A9),
  // (':triangular_ruler:', #$0001F4D0), (':trident:', #$0001F531),
  // (':trolleybus:', #$0001F68E), (':trophy:', #$0001F3C6),
  // (':tropical_drink:', #$0001F379), (':tropical_fish:', #$0001F420),
  // (':trumpet:', #$0001F3BA), (':tulip:', #$0001F337),
  // (':turkey:', #$0001F983), (':turtle:', #$0001F422),
  // (':twisted_rightwards_arrows:', #$0001F500), (':two_hearts:', #$0001F495),
  // (':two_men_holding_hands:', #$0001F46C), (':two_women_holding_hands:',
  // #$0001F46D), (':umbrella:', #$00002602), (':umbrella_on_ground:',
  // #$000026F1), (':unamused:', #$0001F612), (':unicorn_face:', #$0001F984),
  // (':small_red_triangle:', #$0001F53A), (':arrow_up_small:', #$0001F53C),
  // (':arrow_up_down:', #$00002195), (':upside__down_face:', #$0001F643),
  // (':arrow_up:', #$00002B06), (':vertical_traffic_light:', #$0001F6A6),
  // (':vibration_mode:', #$0001F4F3), (':v:', #$0000270C),
  // (':video_camera:', #$0001F4F9), (':video_game:', #$0001F3AE),
  // (':vhs:', #$0001F4FC), (':violin:', #$0001F3BB), (':virgo:', #$0000264D),
  // (':volcano:', #$0001F30B), (':volleyball:', #$0001F3D0),
  // (':waning_crescent_moon:', #$0001F318), (':waning_gibbous_moon:',
  // #$0001F316), (':warning:', #$000026A0), (':wastebasket:', #$0001F5D1),
  // (':watch:', #$0000231A), (':water_buffalo:', #$0001F403),
  // (':wc:', #$0001F6BE), (':ocean:', #$0001F30A), (':watermelon:', #$0001F349),
  // (':waving_black_flag:', #$0001F3F4), (':wave:', #$0001F44B),
  // (':waving_white_flag:', #$0001F3F3), (':wavy_dash:', #$00003030),
  // (':waxing_crescent_moon:', #$0001F312), (':moon:', #$0001F314),
  // (':waxing_gibbous_moon:', #$0001F314), (':scream_cat:', #$0001F640),
  // (':weary:', #$0001F629), (':wedding:', #$0001F492),
  // (':weight_lifter:', #$0001F3CB), (':whale2:', #$0001F40B),
  // (':wheel_of_dharma:', #$00002638), (':wheelchair:', #$0000267F),
  // (':point_down:', #$0001F447), (':grey_exclamation:', #$00002755),
  // (':white_flower:', #$0001F4AE), (':white_frowning_face:', #$00002639),
  // (':white_check_mark:', #$00002705), (':white_large_square:', #$00002B1C),
  // (':point_left:', #$0001F448), (':white_medium_small_square:', #$000025FD),
  // (':white_medium_square:', #$000025FB), (':star:', #$00002B50),
  // (':grey_question:', #$00002754), (':point_right:', #$0001F449),
  // (':white_small_square:', #$000025AB), (':relaxed:', #$0000263A),
  // (':white_square_button:', #$0001F533), (':white_sun_behind_cloud:',
  // #$0001F325), (':white_sun_behind_cloud_with_rain:', #$0001F326),
  // (':white_sun_with_small_cloud:', #$0001F324), (':point_up_2:', #$0001F446),
  // (':point_up:', #$0000261D), (':wind_blowing_face:', #$0001F32C),
  // (':wind_chime:', #$0001F390), (':wine_glass:', #$0001F377),
  // (':wink:', #$0001F609), (':wolf:', #$0001F43A), (':woman:', #$0001F469),
  // (':dancers:', #$0001F46F), (':boot:', #$0001F462),
  // (':womans_clothes:', #$0001F45A), (':womans_hat:', #$0001F452),
  // (':sandal:', #$0001F461), (':womens:', #$0001F6BA),
  // (':world_map:', #$0001F5FA), (':worried:', #$0001F61F),
  // (':gift:', #$0001F381), (':wrench:', #$0001F527),
  // (':writing_hand:', #$0000270D), (':yellow_heart:', #$0001F49B),
  // (':yin_yang:', #$0000262F), (':zipper__mouth_face:', #$0001F910));

type
  TftEmojiButtonGroup = class(TGridPanelLayout)
  private
    FMemo: TMemo;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ButtonClicked(Sender: TObject);
    procedure UpdateEmojis;
  published
    property Memo: TMemo read FMemo write FMemo;
    // property Align;
    // property Anchors;
    // property AutoSize;
    // property BevelEdges;
    // property BevelInner;
    // property BevelKind;
    // property BevelOuter;
    // property BevelWidth;
    // property BiDiMode;
    // property BorderWidth;
    // property Caption;
    // property Color;
    // property Constraints;
    // property Ctl3D;
    // property UseDockManager default True;
    // property DockSite;
    // property DoubleBuffered;
    // property DragCursor;
    // property DragKind;
    // property DragMode;
    // property Enabled;
    // property Font;
    // property Padding;
    // property ParentBiDiMode;
    // property ParentBackground;
    // property ParentColor;
    // property ParentCtl3D;
    // property ParentDoubleBuffered;
    // property ParentFont;
    // property ParentShowHint;
    // property PopupMenu;
    // property ShowHint;
    // property TabOrder;
    // property TabStop;
    // property Touch;
    // property Visible;
    // property StyleElements;
    // property StyleName;
    // property OnAlignInsertBefore;
    // property OnAlignPosition;
    // property OnClick;
    // property OnConstrainedResize;
    // property OnContextPopup;
    // property OnDockDrop;
    // property OnDockOver;
    // property OnDblClick;
    // property OnDragDrop;
    // property OnDragOver;
    // property OnEndDock;
    // property OnEndDrag;
    // property OnEnter;
    // property OnExit;
    // property OnGesture;
    // property OnGetSiteInfo;
    // property OnMouseActivate;
    // property OnMouseDown;
    // property OnMouseEnter;
    // property OnMouseLeave;
    // property OnMouseMove;
    // property OnMouseUp;
    // property OnResize;
    // property OnStartDock;
    // property OnStartDrag;
    // property OnUnDock;
  end;

  TftKeybordEmoji = class(TScrollBox)
  private
    FKeybord: TftEmojiButtonGroup;
    FEdSearch: TEdit;
    procedure EdSearchChange(Sender: TObject);
    function GetMemo: TMemo;
    procedure SetMemo(const Value: TMemo);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Keybord: TftEmojiButtonGroup read FKeybord write FKeybord;
    property Memo: TMemo read GetMemo write SetMemo;
    // property Align;
    // property Anchors;
    // property AutoSize;
    // property BevelEdges;
    // property BevelInner;
    // property BevelKind;
    // property BevelOuter;
    // property BevelWidth;
    // property BiDiMode;
    // property BorderWidth;
    // property Caption;
    // property Color;
    // property Constraints;
    // property Ctl3D;
    // property UseDockManager default True;
    // property DockSite;
    // property DoubleBuffered;
    // property DragCursor;
    // property DragKind;
    // property DragMode;
    // property Enabled;
    // property Font;
    // property Padding;
    // property ParentBiDiMode;
    // property ParentBackground;
    // property ParentColor;
    // property ParentCtl3D;
    // property ParentDoubleBuffered;
    // property ParentFont;
    // property ParentShowHint;
    // property PopupMenu;
    // property ShowHint;
    // property TabOrder;
    // property TabStop;
    // property Touch;
    // property Visible;
    // property StyleElements;
    // property StyleName;
    // property OnAlignInsertBefore;
    // property OnAlignPosition;
    // property OnClick;
    // property OnConstrainedResize;
    // property OnContextPopup;
    // property OnDockDrop;
    // property OnDockOver;
    // property OnDblClick;
    // property OnDragDrop;
    // property OnDragOver;
    // property OnEndDock;
    // property OnEndDrag;
    // property OnEnter;
    // property OnExit;
    // property OnGesture;
    // property OnGetSiteInfo;
    // property OnMouseActivate;
    // property OnMouseDown;
    // property OnMouseEnter;
    // property OnMouseLeave;
    // property OnMouseMove;
    // property OnMouseUp;
    // property OnResize;
    // property OnStartDock;
    // property OnStartDrag;
    // property OnUnDock;
  end;

const
  EMOJIS_CONSTANT: TftAllDictConstant =
  // Smiley Face Emojis
    (('🙂', 'Slightly smiling face', #$1F642),

    ('😀', 'Smiling face', #$1F600),

    ('😃', 'Smiling face with big eyes', #$1F603),

    ('😄', 'Smiling face with smiling eyes', #$1F604),

    ('😁', 'Beaming face with smiling eyes', #$1F601),

    ('😅', 'Smiling face with tears', #$1F605),

    ('😆', 'Grinning face', #$1F606),

    ('🤣', 'Rolling on the floor laughing', #$1F923),

    ('😂', 'Lauging with tears', #$1F602),

    ('🙃', 'Upside down face', #$1F643),

    ('😉', 'Winking face', #$1F609),

    ('😊', 'Smiling face with smiling eyes', #$1F60A),

    ('😇', 'Smiling face with halo', #$1F607),

    ('😎', 'Smiling face with sunglasses', #$1F60E),

    ('🤓', 'Nerdy face', #$1F913),

    ('🧐', 'Face with monocle', #$1F9D0),

    ('🥳', 'Partying face', #$1F973),

    // Emotional Faces

    ('🥰', 'Smiling face with hearts', #$1F970),

    ('😍', 'Smiling face with heart eyes', #$1F60D),

    ('🤩', 'Star-struck', #$1F60D),

    ('😘', 'Face blowing kiss', #$1F618),

    ('😗', 'Kissing face', #$1F617),

    ('☺', 'Smiling face', #$263A),

    ('😚', 'Kissing face with closed eyes', #$1F61A),

    ('😙', 'Kissng face with smiling eyes', #$1F619),

    ('🥲', 'Smiling face with tears', #$1F972),

    // Faces with Tongue Emojis

    ('😋', 'Yummy face', #$1F60B),

    ('😛', 'Face with tongue', #$1F61B),

    ('😜', 'WInking face with tongue', #$1F61C),

    ('🤪', 'Zanny face', #$1F92A),

    ('😝', 'Squinting face with tongue', #$1F61D),

    ('🤑', 'Money face with money tongue', #$1F911),

    // Faces with Hands Emojis

    ('🤗', 'Hugs', #$1F917),

    ('🤭', 'Face with hand in mouth', #$1F92D),

    ('🤫', 'Shushing face', #$1F92B),

    ('🤔', 'Thinkin face', #$1F914),

    // Neutral Faces Emojis

    ('😐', 'Neutral face', #$1F610),

    ('🤐', 'Zipped mouth', #$1F910),

    ('🤨', 'Face with raised eyebrow', #$1F928),

    ('😑', 'Expressionless face', #$1F611),

    ('😶', 'Face with no mouth', #$1F636),

    ('😏', 'Smirking face', #$1F60F),

    ('😒', 'Unamused face', #$1F612),

    ('🙄', 'Face with rolling eyes', #$1F644),

    ('😬', 'Grimacing face', #$1F62C),

    ('😮‍💨', 'Grimacing face', #$1F4A8),

    ('🤥', 'Lying face', #$1F925),

    // Sleepy Faces Emojis

    ('😪', 'Sleepy face', #$1F62A),

    ('😴', 'Sleeping face', #$1F634),

    ('😌', 'Relieved face', #$1F60C),

    ('😔', 'Pensive face', #$1F614),

    ('🤤', 'Drooling face', #$1F924),

    // Sick Faces Emojis

    ('😷', 'Face with mask', #$1F637),

    ('🤒', 'Face with thermometer', #$1F912),

    ('🤕', 'Face with bandage', #$1F915),

    ('🤢', 'Nauseous face', #$1F922),

    ('🤮', 'Vomiting face', #$1F92E),

    ('🤧', 'Sneezing face', #$1F927),

    ('🥵', 'Hot face', #$1F975),

    ('🥶', 'Cold face', #$1F976),

    ('🥴', 'Woozy face', #$1F974),

    ('😵', 'Face with crossed-out face', #$1F635),

    ('🤯', 'Face with exploding head', #$1F92F),

    // Concerned Faces Emojis

    ('😕', 'Confused face', #$1F615),

    ('😟', 'Worried face', #$1F61F),

    ('🙁', 'Slightly frowning face', #$1F641),

    ('☹', 'Frowning face', #$2639),

    ('😮', 'Face with open mouth', #$1F62E),

    ('😯', 'Hushed face', #$1F62F),

    ('😲', 'Astonished face', #$1F632),

    ('😳', 'Flushed face', #$1F633),

    ('🥺', 'Begging face', #$1F97A),

    ('😦', 'Frowning face with open mouth', #$1F626),

    ('😧', 'Angushed face', #$1F627),

    ('😨', 'Fearful face', #$1F628),

    ('😰', 'Anxious face with sweat', #$1F630),

    ('😥', 'Sad but relieved face', #$1F625),

    ('😢', 'Crying face', #$1F622),

    ('😭', 'Loudly crying face', #$1F62D),

    ('😱', 'Screaming face', #$1F631),

    ('😖', 'Confounded face', #$1F616),

    ('😣', 'Persevering face', #$1F623),

    ('😞', 'Disapointed face', #$1F61E),

    ('😓', 'Downcast face with sweat', #$1F613),

    ('😩', 'Weary face', #$1F629),

    ('😫', 'Tired face', #$1F62B),

    ('🥱', 'Yawning face', #$1F971),

    // Negative Faces

    ('😤', 'Face with steam', #$1F624),

    ('😡', 'Pouting face', #$1F621),

    ('😠', 'Angry face', #$1F620),

    ('🤬', 'Face with symbols on mouth', #$1F92C),

    ('😈', 'Smiling face with horns', #$1F608),

    ('👿', 'Angry face with horns', #$1F47F),

    ('💀', 'Skull', #$1F480),

    ('☠', 'Skull and cross-bone', #$2620),

    // Costume Faces Emojis

    ('💩', 'Pile of poo', #$1F4A9),

    ('🤡', 'Clown', #$1F921),

    ('👹', 'Ogre', #$1F479),

    ('👺', 'Goblin', #$1F47A),

    ('👻', 'Ghost', #$1F47B),

    ('👽', 'Alien', #$1F47D),

    ('👾', 'Alien monster', #$1F47E),

    ('🤖', 'Robot', #$1F916),

    // Cat Faces Emojis

    ('😺', 'Grinnig cat', #$1F63A),

    ('😸', 'Grinning cat with smiling eyes', #$1F638),

    ('😹', 'Grinning cat with tears', #$1F639),

    ('😻', 'Smiling cat with heart eyes', #$1F63B),

    ('😼', 'Cat with wry smile', #$1F63C),

    ('😽', 'Kissing cat', #$1F63D),

    ('🙀', 'Weary cat', #$1F640),

    ('😿', 'Crying cat', #$1F63F),

    ('😾', 'Pouting cat', #$1F63E),

    // Monkey Faces Emojis

    ('🙈', 'See no evil monkey', #$1F648),

    ('🙉', 'Hear no evil monkey', #$1F649),

    ('🙊', 'Speak no evil monkey', #$1F64A),

    // Emotion Emojis

    ('💋', 'Kiss', #$1F48B),

    ('💌', 'Love letter', #$1F48C),

    ('💘', 'Heart with arrow', #$1F498),

    ('💝', 'HEart with ribbon', #$1F49D),

    ('💖', 'Sparking heart', #$1F496),

    ('💗', 'Growing heart', #$1F497),

    ('💓', 'Beating heart', #$1F493),

    ('💞', 'Revolving heart', #$1F49E),

    ('💕', 'Two hearts', #$1F495),

    ('💟', 'Heart decoration', #$1F49F),

    ('❣', 'Heart exclamation', #$2763),

    ('💔', 'Broken heart', #$1F494),

    ('❤️‍🔥', 'Heart on fire', #$2764),

    ('❤️‍🩹', 'Mending heart', #$2764),

    ('❤', 'Red heart', #$2764),

    ('🧡', 'Orange heart', #$1F9E1),

    ('💛', 'Yellow heart', #$1F49B),

    ('💚', 'Green heart', #$1F49A),

    ('💙', 'Blue heart', #$1F499),

    ('💜', 'Purple heart', #$1F49C),

    ('🤎', 'Brown heart', #$1F90E),

    ('🖤', 'Black heart', #$1F5A4),

    ('🤍', 'White heart', #$1F90D),

    ('💯', 'Hundred(correct)', #$1F4AF),

    ('💢', 'Anger', #$1F4A2),

    ('💥', 'collision', #$1F4A5),

    ('💫', 'Dizzy', #$1F4AB),

    ('💦', 'Sweat droplets', #$1F4A6),

    ('💨', 'Dashing away', #$1F4A8),

    ('🕳', 'Hole', #$1F573),

    ('💣', 'Bomb', #$1F4A3),

    ('💬', 'Message baloon', #$1F4AC),

    ('👁️‍🗨️', 'Eye in speech bubble', #$1F441),

    ('🗨', 'Left speech bubble', #$1F5E8),

    ('🗯', 'Anger bubble', #$1F5EF),

    ('💭', 'Thought baloon', #$1F4AD),

    ('💤', 'zzz', #$1F4A4),

    // Hands and other Body Parts Emojis

    ('👋', 'Waving hand', #$1F44B),

    ('🤚', 'Raised back of hand', #$1F91A),

    ('🖐', 'Hands with splayed finger', #$1F590),

    ('✋', 'Raised hand', #$270B),

    ('🖖', 'Vulcan salute', #$1F596),

    ('👌', 'Ok', #$1F44C),

    ('🤌', 'Pinched fingers', #$1F90C),

    ('🤏', 'Pinched hand', #$1F90F),

    ('✌', 'Victory hand', #$270C),

    ('🤞', 'Crossed fingers', #$1F91E),

    ('🤟', 'Love you', #$1F91F),

    ('🤘', 'Horn sign', #$1F918),

    ('🤙', 'Call me hand', #$1F919),

    ('👈', 'Index finger pointing left', #$1F448),

    ('👉', 'Index finger pointing right', #$1F449),

    ('👆', 'Index finger pointing up', #$1F446),

    ('👇', 'Index finger pointing down', #$1F447),

    ('🖕', 'Middle finger', #$1F595),

    ('☝', 'Forehand Index finger pointing up', #$261D),

    ('🫵', 'Index finger pointing at viewer', #$1FAF5),

    ('👍', 'Thumbs up', #$1F44D),

    ('👎', 'Thumbs down', #$1F44E),

    ('✊', 'Raised fist', #$270A),

    ('👊', 'Fist', #$1F44A),

    ('🤛', 'Left facing fist', #$1F91B),

    ('🤜', 'Right facing fist', #$1F91C),

    ('👏', 'Clapping hands', #$1F44F),

    ('🙌', 'Raised hands', #$1F64C),

    ('👐', 'OPen hands', #$1F450),

    ('🤲', 'Palms together hands', #$1F932),

    ('🤝', 'Handshake', #$1F91D),

    ('🙏', 'Praying hands', #$1F64F),

    ('✍', 'Writing hands', #$270D),

    ('💅', 'Nail polish', #$1F485),

    ('🤳', 'Selfie hand', #$1F933),

    ('💪', 'Flexed biceps', #$1F4AA),

    ('🦾', 'MEchanical arm', #$1F9BE),

    ('🦵', 'Leg', #$1F9B5),

    ('🦿', 'Mechanical leg', #$1F9BF),

    ('🦶', 'Foot', #$1F9B6),

    ('👂', 'Ear', #$1F442),

    ('🦻', 'Ear with earing aid', #$1F9BB),

    ('👃', 'Nose', #$1F443),

    ('🧠', 'Brain', #$1F9E0),

    ('👣', 'Footprint', #$1F463),

    ('🫀', 'MEchanical heart', #$1FAC0),

    ('🫁', 'Lungs', #$1FAC1),

    ('🦷', 'Tooth', #$1F9B7),

    ('🦴', 'Bone', #$1F9B7),

    ('👀', 'Eyes', #$1F440),

    ('👁', 'Eye', #$1F441),

    ('👅', 'Nose', #$1F445),

    ('👄', 'Mouth', #$1F444),

    // Person Emojis

    ('🧑', 'Person', #$1F9D1),

    ('👶', 'Baby', #$1F476),

    ('🧒', 'Child', #$1F9D2),

    ('👦', 'Boy', #$1F466),

    ('👧', 'Girl', #$1F467),

    ('👱', 'Person with blonde hair', #$1F471),

    ('👨', 'Man', #$1F468),

    ('🧔', 'Bearded person', #$1F9D4),

    ('🧔‍♂‍', 'Bearded man', #$1F9D4),

    ('🧔‍♀‍', 'Bearded woman', #$1F9D4),

    ('👨‍🦰', 'MAn with red hair', #$1F468),

    ('👨‍🦱', 'Man with curly hair', #$1F9B1),

    ('👨‍🦳', 'Man with white hair', #$200D),

    ('👨‍🦲', 'Bald man', #$1F468),

    ('👩', 'Woman', #$1F469),

    ('👩‍🦰', 'Woman with red hair', #$1F469),

    ('👩‍🦱', 'Woman with curly hair', #$1F469),

    ('👩‍🦳', 'Woman with white hair', #$1F469),

    ('👩‍🦲', 'Bald woman', #$1F469),

    ('👱‍♀‍', 'Woman with blode hair', #$1F471),

    ('👱‍♂‍', 'Man with blonde hair', #$1F471),

    ('🧓', 'Old person', #$1F9D3),

    ('👴', 'Old man', #$1F474),

    ('👵', 'Old woman', #$1F475),

    ('🙍', 'Person frowning', #$1F64D),

    ('🙍‍♂‍', 'Man frowning', #$1F64D),

    ('🙍‍♀‍', 'Woman frowning', #$1F64D),

    ('🙎', 'Person pouting', #$1F64E),

    ('🙎‍♂‍', 'Man pouting', #$1F64E),

    ('🙎‍♀‍', 'Woman pouting', #$1F64E),

    ('🙅', 'Person gesturing no', #$1F645),

    ('🙅‍♂‍', 'Man gesturing no', #$1F645),

    ('🙅‍♀‍', 'Woman gesturing no', #$1F645),

    ('🙆', 'Person stretching', #$1F646),

    ('🙆‍♂‍', 'Man stretching', #$1F646),

    ('🙆‍♀‍', 'Woman stretching', #$1F646),

    ('💁', 'Person tipping hand', #$1F481),

    ('💁‍♂‍', 'Man tipping hand', #$1F481),

    ('💁‍♀‍', 'Woman tipping hand', #$1F481),

    ('🙋', 'Person rainsing hand', #$1F64B),

    ('🙋‍♂‍', 'Man raising hand', #$1F64B),

    ('🙋‍♀‍', 'Woman raisning hand', #$1F64B),

    ('🧏', 'Deaf person', #$1F64B),

    ('🧏‍♂‍', 'Deaf man', #$1F9CF),

    ('🧏‍♀‍', 'Deaf woman', #$2640),

    ('🙇', 'Person bowing', #$1F647),

    ('🙇‍♂‍', 'Man bowing', #$1F647),

    ('🙇‍♀‍', 'Woman bowing', #$200D),

    ('🤦', 'Person facepalming', #$1F926),

    ('🤦‍♂‍', 'Man facepalming', #$1F926),

    ('🤦‍♀‍', 'Woman facepalming', #$1F926),

    ('🤷', 'Person shrugging', #$1F937),

    ('🤷‍♂‍', 'Man shrugging', #$1F937),

    ('🤷‍♀‍', 'Woman shrugging', #$FE0F),

    ('🧑‍⚕‍', 'Health worker', #$1F9D1),

    ('👨‍⚕‍', 'Man health worker', #$2695),

    ('👩‍⚕‍', 'Woman health worker', #$1F469),

    ('🧑‍🎓', 'Student', #$1F9D1),

    ('👨‍🎓', 'Man student', #$1F468),

    ('🧑‍🏫', 'Teacher', #$1F9D1),

    ('👨‍🏫', 'Man teacher', #$1F468),

    ('👩‍🏫', 'Woman teacher', #$1F3EB),

    ('🧑‍⚖‍', 'Judge', #$1F9D1),

    ('👨‍⚖‍', 'Man judge', #$1F468),

    ('👩‍⚖‍', 'Woman judge', #$1F469),

    ('🧑‍🌾', 'Farmer', #$200D),

    ('👨‍🌾', 'Man farmer', #$1F468),

    ('👩‍🌾', 'Woman farmer', #$1F469),

    ('🧑‍🍳', 'Cook', #$1F9D1),

    ('👨‍🍳', 'Man cook', #$200D),

    ('👩‍🍳', 'Woman cook', #$1F469),

    ('🧑‍🔧', 'Mechanic', #$1F9D1),

    ('👨‍🔧', 'Man mechanic', #$1F527),

    ('👩‍🔧', 'Woman mechanic', #$1F469),

    ('🧑‍🏭', 'Factory worker', #$1F9D1),

    ('👨‍🏭', 'Man factory worker', #$1F468),

    ('👩‍🏭', 'Woman factory worker', #$1F469),

    ('🧑‍💼', 'Office worker', #$1F9D1),

    ('👨‍💼', 'Man office worker', #$1F4BC),

    ('👩‍💼', 'Woma office worker', #$1F469),

    ('🧑‍🔬', 'Scientist', #$1F9D1),

    ('👨‍🔬', 'Man scientist', #$1F468),

    ('👩‍🔬', 'Woman scientist', #$1F52C),

    ('🧑‍💻', 'Technologist', #$1F9D1),

    ('👨‍💻', 'Man texhnologist', #$1F468),

    ('👩‍💻', 'Woman technologist', #$1F469),

    ('🧑‍🎤', 'Singer', #$1F3A4),

    ('👨‍🎤', 'Man singer', #$1F468),

    ('👩‍🎤', 'Woman singer', #$1F469),

    ('🧑‍🎨', 'Artist', #$1F9D1),

    ('👨‍🎨', 'Man artist', #$1F468),

    ('👩‍🎨', 'Woman artist', #$1F469),

    ('🧑‍✈‍', 'Pilot', #$1F9D1),

    ('👨‍✈‍', 'Man pilot', #$1F468),

    ('👩‍✈‍', 'Woman pilot', #$1F469),

    ('🧑‍🚀', 'Astronaut', #$1F9D1),

    ('👨‍🚀', 'Man astronaut', #$1F468),

    ('👩‍🚀', 'Woman astronaut', #$1F469),

    ('🧑‍🚒', 'Firefighter', #$1F9D1),

    ('👨‍🚒', 'Man firefighter', #$200D),

    ('👩‍🚒', 'Woman firefighter', #$1F692),

    ('👮', 'Police', #$1F46E),

    ('👮‍♂‍', 'Policeman', #$1F46E),

    ('👮‍♀‍', 'Policewoman', #$1F46E),

    ('🕵', 'Detective', #$1F575),

    ('🕵️‍♂‍', 'Man detective', #$1F575),

    ('🕵️‍♀‍', 'Woman detective', #$1F575),

    ('💂', 'Guard', #$1F482),

    ('💂‍♂‍', 'Man guard', #$2642),

    ('💂‍♀‍', 'Woman guard', #$2640),

    ('🥷', 'Ninja', #$1F97),

    ('👷', 'Construction worker', #$1F477),

    ('👷‍♂‍', 'Man construction worker', #$200D),

    ('👷‍♀‍', 'Woman construction worker', #$2640),

    ('🤴', 'Prince', #$1F934),

    ('👸', 'Princess', #$1F478),

    ('👳', 'Person wearing turban', #$1F473),

    ('👳‍♂‍', 'Man wearing turban', #$200D),

    ('👳‍♀‍', 'Woman wearing turban', #$2640),

    ('👲', 'Person with skullcap', #$1F472),

    ('🧕', 'Woman with headscaff', #$1F9D5),

    ('🤵', 'Person in tuxedo', #$1F935),

    ('🤵‍♂‍', 'Man in tuxedo', #$1F935),

    ('🤵‍♀‍', 'Woman in tuxedo', #$1F935),

    ('👰', 'Person in veil', #$1F470),

    ('👰‍♂‍', 'Man in veil', #$1F470),

    ('👰‍♀‍', 'Woman in veil', #$200D),

    ('🤰', 'Pregnant woman', #$1F930),

    ('🤱', 'Breast-feeding', #$1F931),

    ('🧑‍🍼', 'Person feeding baby', #$1F37C),

    ('👩‍🍼', 'WOman feeding baby', #$1F469),

    ('👨‍🍼', 'Man feeding baby', #$200D),

    ('👼', 'Baby angel', #$1F47C),

    ('🎅', 'Santa claus', #$1F385),

    ('🤶', 'Mrs Claus', #$1F936),

    ('🧑‍🎄', 'Mx Claus', #$1F9D1),

    ('🦸', 'Superhero', #$1F9B8),

    ('🦸‍♂‍', 'Man superhero', #$200D),

    ('🦸‍♀‍', 'Woman superhero', #$FE0F),

    ('🦹', 'Supervillain', #$1F9B9),

    ('🦹‍♂‍', 'Man superhero', #$2642),

    ('🦹‍♀‍', 'Woman superhero', #$200D),

    ('🧙', 'Mage', #$1F9D9),

    ('🧙‍♂‍', 'Man mage', #$1F9D9),

    ('🧙‍♀‍', 'Woman mage', #$2640),

    ('🧚', 'Fairy', #$1F9DA),

    ('🧚‍♂‍', 'Man fairy', #$2642),

    ('🧚‍♀‍', 'Woman fairy', #$200D),

    ('🧛', 'Vampire', #$1F9DB),

    ('🧛‍♂‍', 'Man vampire', #$2642),

    ('🧛‍♀‍', 'Woman vampire', #$FE0F),

    ('🧜', 'Merperson', #$1F9DC),

    ('🧜‍♂‍', 'Merman', #$200D),

    ('🧜‍♀‍', 'Mermaid', #$1F9DC),

    ('🧝', 'Elf', #$1F9DD),

    ('🧝‍♂‍', 'Man elf', #$2642),

    ('🧝‍♀‍', 'Woman elf', #$200D),

    ('🧞', 'Genie', #$1F9DE),

    ('🧞‍♂‍', 'Man genie', #$200D),

    ('🧞‍♀‍', 'Woman genie', #$2640),

    ('🧟', 'Zombie', #$1F9DF),

    ('🧟‍♂‍', 'Man zombie', #$2642),

    ('🧟‍♀‍', 'Woman zombie', #$FE0F),

    ('💆', 'Person getting massage', #$1F486),

    ('💆‍♂‍', 'Man getting massage', #$200D),

    ('💆‍♀‍', 'Woman getting massage', #$2640),

    ('💇', 'Person getting haircut', #$1F487),

    ('💇‍♂‍', 'Man getting haircut', #$200D),

    ('💇‍♀‍', 'Woman getting haircut', #$2640),

    ('🚶', 'Person walking', #$1F6B6),

    ('🚶‍♂‍', 'Man walking', #$200D),

    ('🚶‍♀‍', 'Woman walking', #$FE0F),

    ('🧍', 'Person standing', #$1F9CD),

    ('🧍‍♂‍', 'Man standing', #$200D),

    ('🧍‍♀‍', 'Woman standing', #$FE0F),

    ('🧎', 'Person kneeling', #$1F9CE),

    ('🧎‍♂‍', 'Man kneeling', #$200D),

    ('🧎‍♀‍', 'Woman kneeling', #$FE0F),

    ('🧑‍🦯', 'PErson with walking stick', #$200D),

    ('👨‍🦯', 'Man with walking stick', #$1F468),

    ('👩‍🦯', 'Woman with walking stick', #$1F9AF),

    ('🧑‍🦼', 'Person in motorized wheelchair', #$1F9D1),

    ('👨‍🦼', 'Man in motorized wheelchair', #$200D),

    ('👩‍🦼', 'Womain in motorized wheelchair', #$1F9BC),

    ('🧑‍🦽', 'Person in manual wheelchair', #$1F9D1),

    ('👨‍🦽', 'Man in manual wheelchair', #$200D),

    ('👩‍🦽', 'Womaan in motorized wheelchair', #$1F9BD),

    ('🏃', 'Person sprinting', #$1F3C3),

    ('🏃‍♂‍', 'Man sprinting', #$2642),

    ('🏃‍♀‍', 'Woman sprinting', #$2640),

    ('💃', 'Woman dancing', #$1F483),

    ('🕺', 'Man dancing', #$1F57A),

    ('🕴', 'Person in suit levitating', #$1F574),

    ('👯', 'People with bunny ears', #$1F46F),

    ('👯‍♂‍', 'Men with bunny ears', #$200D),

    ('👯‍♀‍', 'Women in bunny ears', #$2640),

    ('🧖', 'Person in steaming room', #$1F9D6),

    ('🧖‍♂‍', 'Man in steaming room', #$200D),

    ('🧖‍♀‍', 'Woman in steaming room', #$200D),

    ('🧗', 'Person climbing', #$1F9D7),

    ('🧗‍♂‍', 'Man climbing', #$200D),

    ('🧗‍♀‍', 'Woman climbing', #$2640),

    ('🤺', 'Person fencing', #$1F93A),

    ('🏇', 'Horse racing', #$1F3C7),

    ('⛷', 'Skier', #$26F7),

    ('🏂', 'Snowball', #$1F3C2),

    ('🏌', 'Person playing golf', #$1F3CC),

    ('🏌️‍♂‍', 'Man playing golf', #$FE0F),

    ('🏌️‍♀‍', 'Woman playing golf', #$200D),

    ('🏄', 'Person surfing', #$1F3C4),

    ('🏄‍♂‍', 'Man surfing', #$2642),

    ('🏄‍♀‍', 'Woman surfing', #$2640),

    ('🚣', 'Person rowing boat', #$1F6A3),

    ('🚣‍♂‍', 'Man rowing boat', #$2642),

    ('🚣‍♀‍', 'Woman rowing boat', #$FE0F),

    ('🏊', 'Person swimming', #$1F3CA),

    ('🏊‍♂‍', 'Man swimming', #$2642),

    ('🏊‍♀‍', 'Woman swimming', #$FE0F),

    ('⛹', 'Person bouncing ball', #$26F9),

    ('⛹️‍♂‍', 'Man bouncing ball', #$FE0F),

    ('⛹️‍♀‍', 'Woman bouncing ball', #$2640),

    ('🏋', 'Person lifting weight', #$1F3CB),

    ('🏋️‍♂‍', 'Man lifting weight', #$FE0F),

    ('🏋️‍♀‍', 'Woman lifting weight', #$2640),

    ('🚴', 'Person cycling', #$1F6B4),

    ('🚴‍♂‍', 'Man cycling', #$2642),

    ('🚴‍♀‍', 'Woman cycling', #$FE0F),

    ('🚵', 'Person mountain biking', #$1F6B5),

    ('🚵‍♂‍', 'Man mountain biking', #$2642),

    ('🚵‍♀‍', 'Woman mountain biking', #$2640),

    ('🤸', 'Person catwheeling', #$1F938),

    ('🤸‍♂‍', 'Man catwheeling', #$200D),

    ('🤸‍♀‍', 'Woman catwheeling', #$FE0F),

    ('🤼', 'People wrestling', #$1F93C),

    ('🤼‍♂‍', 'Men wrestling', #$200D),

    ('🤼‍♀‍', 'Women wrestling', #$2640),

    ('🤽', 'Person playing water polo', #$1F93D),

    ('🤽‍♂‍', 'Man playing water polo', #$FE0F),

    ('🤽‍♀‍', 'Woman playing water polo', #$200D),

    ('🤾', 'Person playing handball', #$1F93E),

    ('🤾‍♂‍', 'Man playing handball', #$200D),

    ('🤾‍♀‍', 'Woman playing handball', #$FE0F),

    ('🤹', 'Person juggling', #$1F939),

    ('🤹‍♂‍', 'Man juggling', #$200D),

    ('🤹‍♀‍', 'Woman juggling', #$FE0F),

    ('🧘', 'Person lotus position', #$1F9D8),

    ('🧘‍♂‍', 'Man in lotus position', #$200D),

    ('🧘‍♀‍', 'Woman in lotus position', #$2640),

    ('🛀', 'Person bathing', #$1F6C0),

    ('🛌', 'Person in bed', #$1F6CC),

    ('👪', 'Family', #$1F46A),

    ('👨‍👩‍👦', 'Family: man, woman, and boy', #$200D),

    ('👨‍👩‍👧', 'Family: man, woman, and girl', #$1F469),

    ('👨‍👩‍👧‍👦', 'Family: man, woman, boy, and girl', #$200D),

    ('👨‍👩‍👦‍👦', 'Family: man, woman, and two boys', #$1F466),

    ('👨‍👩‍👧‍👧', 'Family: man, woman, and two girls', #$200D),

    ('👨‍👨‍👦', 'Family: two men and boy', #$1F466),

    ('👨‍👨‍👧', 'Family: two men and girl', #$200D),

    ('👨‍👨‍👧‍👦', 'Family: two men, girl, and boy', #$1F466),

    ('👨‍👨‍👦‍👦', 'Family: two men and two boys', #$200D),

    ('👨‍👨‍👧‍👧', 'Family: two men and two girls', #$1F467),

    ('👩‍👩‍👦', 'Family: two women and boy', #$1F466),

    ('👩‍👩‍👧', 'Family: two women and girl', #$1F467),

    ('👩‍👩‍👧‍👦', 'Family: two women, girl, and boy', #$1F466),

    ('👩‍👩‍👦‍👦', 'Family: two women and two boys', #$1F466),

    ('👩‍👩‍👧‍👧', 'Family: two women and two girls', #$1F467),

    ('👨‍👦', 'Family: man and boy', #$1F466),

    ('👨‍👦‍👦', 'Family: man and two boys', #$1F466),

    ('👨‍👧', 'Family: man and girl', #$1F467),

    ('👨‍👧‍👦', 'Family: man, girl and boy', #$1F466),

    ('👨‍👧‍👧', 'Family: man and two girls', #$1F467),

    ('👩‍👦', 'Family: woman and boy', #$1F466),

    ('👩‍👦‍👦', 'Family: woman and two boys', #$1F466),

    ('👩‍👧', 'Family: woman and girl', #$1F467),

    ('👩‍👧‍👦', 'Family: woman, girl, and boy', #$1F466),

    ('👩‍👧‍👧', 'Family: woman and two girls', #$1F467),

    ('🧑‍🤝‍🧑', 'People holding hands', #$1F9D1),

    ('👭', 'Women holding hands', #$1F46D),

    ('👫', 'Woman and man holding hands', #$1F46B),

    ('👬', 'Men holding hands', #$1F46C),

    ('💏', 'Kiss', #$1F48F),

    ('👩‍❤‍💋‍👨', 'Woman and man kissing', #$200D),

    ('👨‍❤‍💋‍👨', 'Man and man kissing', #$200D),

    ('👩‍❤‍💋‍👩', 'Womand and woman kissing', #$1F48B),

    ('💑', 'Couple with heart', #$1F491),

    ('🗣', 'Person speaking', #$1F5E3),

    ('👤', 'Bust in silhouhette', #$1F464),

    ('👥', 'Busts in silhouette', #$1F465),

    ('🫂', 'People hugging', #$1FAC2),

    // Animals and Nature Emojis

    ('🐵', 'Monkey face', #$1F435),

    ('🐒', 'Monkey', #$1F412),

    ('🦍', 'Gorilla', #$1F98D),

    ('🦧', 'Orangutan', #$1F9A7),

    ('🐶', 'Dog face', #$1F436),

    ('🐕', 'Dog', #$1F415),

    ('🦮', 'Guide dog', #$1F9AE),

    ('🐕‍🦺', 'Service dog', #$1F415),

    ('🐩', 'Poodle', #$1F429),

    ('🐺', 'Wolf', #$1F43A),

    ('🦊', 'Fox', #$1F98A),

    ('🦝', 'Racoon', #$1F99D),

    ('🐱', 'Cat face', #$1F431),

    ('🐈', 'Cat', #$1F408),

    ('🐈‍⬛', 'Black cat', #$200D),

    ('🦁', 'Lion', #$1F981),

    ('🐯', 'Tiger face', #$1F42F),

    ('🐅', 'Tiger', #$1F405),

    ('🐆', 'Leopard', #$1F406),

    ('🐴', 'Horse face', #$1F434),

    ('🐎', 'Horse', #$1F40E),

    ('🦄', 'Unicorn', #$1F984),

    ('🦓', 'Zebra', #$1F993),

    ('🦌', 'Deer', #$1F98C),

    ('🦬', 'Bison', #$1F9AC),

    ('🐮', 'Cow face', #$1F42E),

    ('🐄', 'Cow', #$1F404),

    ('🐂', 'Ox', #$1F402),

    ('🐃', 'Water buffalo', #$1F437),

    ('🐷', 'Pig face', #$1F437),

    ('🐖', 'Pig', #$1F416),

    ('🐗', 'Boar', #$1F417),

    ('🐽', 'Pig nose', #$1F43D),

    ('🐏', 'Ram', #$1F40F),

    ('🐑', 'Ewe', #$1F411),

    ('🐐', 'Goat', #$1F410),

    ('🐪', 'Camel', #$1F42A),

    ('🐫', 'Two hump camel', #$1F42B),

    ('🦙', 'Ilama', #$1F999),

    ('🦒', 'Giraffe', #$1F992),

    ('🐘', 'Elephant', #$1F418),

    ('🦣', 'Mammoth', #$1F9A3),

    ('🦏', 'Rhiniceros', #$1F98F),

    ('🦛', 'Hippopotamus', #$1F99B),

    ('🐭', 'Mouse face', #$1F42D),

    ('🐁', 'Mouse', #$1F401),

    ('🐀', 'Rat', #$1F400),

    ('🐹', 'Hamster', #$1F439),

    ('🐰', 'Rabbit face', #$1F430),

    ('🐇', 'Rabbit', #$1F407),

    ('🐿', 'Chipmunk', #$1F43F),

    ('🦫', 'Beaver', #$1F9AB),

    ('🦔', 'Hedgehog', #$1F994),

    ('🦇', 'Bat', #$1F987),

    ('🐻', 'Bear', #$1F43B),

    ('🐻‍❄️', 'Polar bear', #$200D),

    ('🐨', 'Koala', #$1F428),

    ('🐼', 'Panda', #$1F43C),

    ('🦥', 'Sloth', #$1F9A5),

    ('🦦', 'Otter', #$1F9A6),

    ('🦨', 'Skunk', #$1F9A8),

    ('🦘', 'Kangaroo', #$1F998),

    ('🦡', 'Badger', #$1F9A1),

    ('🐾', 'Paw prints', #$1F43E),

    ('🦃', 'Turkey', #$1F983),

    ('🐔', 'Chicken', #$1F414),

    ('🐓', 'Rooster', #$1F413),

    ('🐣', 'Hatching', #$1F423),

    ('🐤', 'Baby chick', #$1F424),

    ('🐥', 'Front-facing chick', #$1F425),

    ('🐦', 'Bird', #$1F426),

    ('🐧', 'Penguin', #$1F427),

    ('🕊', 'Dove', #$1F54A),

    ('🦅', 'Eagle', #$1F985),

    ('🦆', 'Duck', #$1F986),

    ('🦢', 'Swan', #$1F9A2),

    ('🦉', 'Owl', #$1F989),

    ('🦤', 'Dodo', #$1F9A4),

    ('🪶', 'Feather', #$1FAB6),

    ('🦩', 'Flamingo', #$1F9A9),

    ('🦜', 'Peacock', #$1F99C),

    ('🐸', 'Frog', #$1F438),

    ('🐊', 'Crocodile', #$1F40A),

    ('🐢', 'Turtle', #$1F422),

    ('🦎', 'Lizard', #$1F98E),

    ('🐍', 'Snake', #$1F40D),

    ('🐲', 'Dragon face', #$1F432),

    ('🐉', 'Dragon', #$1F409),

    ('🦕', 'Sauropod', #$1F995),

    ('🦖', 'Tyranosaurus', #$1F996),

    ('🐳', 'Spouting whale', #$1F433),

    ('🐋', 'Whale', #$1F40B),

    ('🐬', 'Dolphin', #$1F42C),

    ('🦭', 'Seal', #$1F9AD),

    ('🐟', 'Fish', #$1F41F),

    ('🐠', 'Tropical fish', #$1F420),

    ('🐡', 'Blowfish', #$1F421),

    ('🦈', 'Shark', #$1F988),

    ('🐙', 'Octopus', #$1F419),

    ('🐚', 'Spiral shell', #$1F41A),

    ('🐌', 'Snail', #$1F40C),

    ('🦋', 'Butterfly', #$1F98B),

    ('🐛', 'Bug', #$1F41B),

    ('🐜', 'Ant', #$1F41C),

    ('🐝', 'Honeybee', #$1F41D),

    ('🪲', 'Beetle', #$1FAB2),

    ('🐞', 'Lady Beetle', #$1F41E),

    ('🦗', 'Cricket', #$1F997),

    ('🪳', 'Cockroach', #$1FAB3),

    ('🕷', 'Spider', #$1F577),

    ('🕸', 'Spider web', #$1F578),

    ('🦂', 'Scorpion', #$1F982),

    ('🦟', 'Mosquito', #$1F99F),

    ('🪰', 'Fly', #$1FAB0),

    ('🪱', 'Worm', #$1FAB1),

    ('🦠', 'Microbe', #$1F9A0),

    ('💐', 'Bouquet', #$1F490),

    ('🌸', 'Cherry blossom', #$1F338),

    ('💮', 'White flower', #$1F4AE),

    ('🏵', 'Rosette', #$1F3F5),

    ('🌹', 'Rose', #$1F339),

    ('🥀', 'Wilted flower', #$1F940),

    ('🌺', 'Hibiscus', #$1F33A),

    ('🌻', 'Sunflower', #$1F33B),

    ('🌼', 'Blossom', #$1F33C),

    ('🌷', 'Tulip', #$1F337),

    ('🌱', 'Seedling', #$1F331),

    ('🪴', 'Potted plant', #$1FAB4),

    ('🌲', 'Evergreen tree', #$1F332),

    ('🌳', 'Deciduous plant', #$1F333),

    ('🌴', 'Palm tree', #$1F334),

    ('🌵', 'Cactus', #$1F335),

    ('🌾', 'Sheaf of rice', #$1F33E),

    ('🌿', 'Herb', #$1F33F),

    ('☘', 'Shamrock', #$2618),

    ('🍀', 'Four leaf clover', #$1F340),

    ('🍁', 'Maple leaf', #$1F341),

    ('🍂', 'Fallen leaf', #$1F342),

    ('🍃', 'Leaf fluttering in wind', #$1F343),

    ('🪴', 'Empty nest', #$1FAB9),

    ('🪴', 'Nest with eggs', #$1FABA),

    // Food and Drinks Emojis

    ('🍇', 'Grapes', #$1F347),

    ('🍈', 'Melon', #$1F348),

    ('🍉', 'Water melon', #$1F349),

    ('🍊', 'Tangerine', #$1F34A),

    ('🍋', 'Lime', #$1F34B),

    ('🍌', 'Banana', #$1F34C),

    ('🍍', 'Pineapple', #$1F34D),

    ('🥭', 'Mango', #$1F96D),

    ('🍎', 'Red apple', #$1F34E),

    ('🍏', 'Green apple', #$1F34F),

    ('🍐', 'Pear', #$1F350),

    ('🍑', 'Peach', #$1F351),

    ('🍒', 'Cherries', #$1F352),

    ('🍓', 'Strawberries', #$1F353),

    ('🫐', 'Blueberries', #$1FAD0),

    ('🥝', 'Kiwi fruit', #$1F95D),

    ('🍅', 'Tomato', #$1F345),

    ('🫒', 'Olive', #$1FAD2),

    ('🥥', 'Coconut', #$1F965),

    ('🥑', 'Avocado', #$1F951),

    ('🍆', 'Eggplant', #$1F346),

    ('🥔', 'Potato', #$1F954),

    ('🥕', 'Carrot', #$1F955),

    ('🌽', 'Corn', #$1F33D),

    ('🌶', 'Pepper', #$1F336),

    ('🫑', 'Bell pepper', #$1FAD1),

    ('🥒', 'Cucumber', #$1F952),

    ('🥬', 'Leafy green', #$1F96C),

    ('🥦', 'Broccoli', #$1F966),

    ('🧄', 'Garlic', #$1F9C4),

    ('🧅', 'Onion', #$1F9C5),

    ('🍄', 'Mushroom', #$1F344),

    ('🥜', 'Peanuts', #$1F95C),

    ('🫑', 'Beans', #$1FAD8),

    ('🌰', 'Chestnut', #$1F330),

    ('🍞', 'Bread', #$1F35E),

    ('🥐', 'Croissant', #$1F950),

    ('🥖', 'Baguette bread', #$1F956),

    ('🫓', 'Flat bread', #$1FAD3),

    ('🥨', 'Pretzel', #$1F968),

    ('🥯', 'Bagel', #$1F96F),

    ('🥞', 'Pancake', #$1F95E),

    ('🧇', 'Waffle', #$1F9C7),

    ('🧀', 'Cheese wedge', #$1F9C0),

    ('🍖', 'Meat with bone', #$1F356),

    ('🍗', 'Poultry leg', #$1F357),

    ('🥩', 'Cut of meat', #$1F969),

    ('🥓', 'Bacon', #$1F953),

    ('🍔', 'Hamburger', #$1F354),

    ('🍟', 'French fries', #$1F35F),

    ('🍕', 'Pizza', #$1F355),

    ('🌭', 'Hot dog', #$1F32D),

    ('🥪', 'Sandwich', #$1F96A),

    ('🌮', 'Taco', #$1F32E),

    ('🌯', 'Burrito', #$1F32F),

    ('🫔', 'Tamale', #$1FAD4),

    ('🥙', 'Stuffed flatbread', #$1F959),

    ('🧆', 'Falafel', #$1F9C6),

    ('🥚', 'Egg', #$1F95A),

    ('🍳', 'Cooking', #$1F373),

    ('🥘', 'Shallow pan of food', #$1F958),

    ('🍲', 'Pot of food', #$1F372),

    ('🫕', 'Fondue', #$1FAD5),

    ('🥣', 'Bowl with food', #$1F963),

    ('🥗', 'Green salad', #$1F957),

    ('🍿', 'Popcorn', #$1F37F),

    ('🧈', 'Butter', #$1F9C8),

    ('🧂', 'Salt', #$1F9C2),

    ('🥫', 'Canned food', #$1F96B),

    ('🍱', 'Bento box', #$1F371),

    ('🍘', 'RIce cracker', #$1F358),

    ('🍙', 'Rice ball', #$1F359),

    ('🍚', 'Cooked rice', #$1F35A),

    ('🍛', 'Curry rice', #$1F35B),

    ('🍜', 'Steaming bowl', #$1F35C),

    ('🍝', 'Spaghetti', #$1F35D),

    ('🍠', 'Roasted sweet potato', #$1F360),

    ('🍢', 'Oden', #$1F362),

    ('🍣', 'Sushi', #$1F363),

    ('🍤', 'Fried shrimp', #$1F364),

    ('🍥', 'Fish cake with swiri', #$1F365),

    ('🥮', 'Moon cake', #$1F96E),

    ('🍡', 'Dango', #$1F361),

    ('🥟', 'Dumpling', #$1F95F),

    ('🥠', 'Fortune cookie', #$1F960),

    ('🥡', 'Take out box', #$1F961),

    ('🦀', 'Crab', #$1F980),

    ('🦞', 'Lobster', #$1F99E),

    ('🦐', 'Shrimp', #$1F990),

    ('🦑', 'Squid', #$1F991),

    ('🦪', 'Oyster', #$1F9AA),

    ('🍨', 'Ice cream', #$1F368),

    ('🍧', 'Shaved ice cream', #$1F367),

    ('🍦', 'Soft ice cream', #$1F366),

    ('🍩', 'Doughnut', #$1F369),

    ('🍪', 'Cookie', #$1F36A),

    ('🎂', 'Birthday cake', #$1F382),

    ('🍰', 'Short cake', #$1F370),

    ('🧁', 'Cup cake', #$1F9C1),

    ('🥧', 'Pie', #$1F967),

    ('🍫', 'Chocoloate', #$1F36B),

    ('🍬', 'Candy', #$1F36C),

    ('🍭', 'Lollipop', #$1F36D),

    ('🍮', 'Custard', #$1F36E),

    ('🍯', 'Honey pot', #$1F36F),

    ('🍼', 'Baby bottle', #$1F37C),

    ('🥛', 'Glass of milk', #$1F95B),

    ('☕', 'Hot beverage', #$2615),

    ('🫖', 'Teapot', #$1FAD6),

    ('🍵', 'Teacup without handle', #$1F375),

    ('🍶', 'Sake', #$1F376),

    ('🍾', 'Bottle with poppin cork', #$1F37E),

    ('🍷', 'Wine glass', #$1F377),

    ('🍸', 'Cocktail glass', #$1F378),

    ('🍹', 'Tropical drink', #$1F379),

    ('🍺', 'Beer mug', #$1F37A),

    ('🍻', 'Clinking beer mug', #$1F37B),

    ('🥂', 'Clinking glasses', #$1F942),

    ('🥃', 'Tumbler glass', #$1F943),

    ('🥤', 'Cup with strawberry', #$1F964),

    ('🧋', 'Bubble tea', #$1F9CB),

    ('🧃', 'Beverage box', #$1F9C3),

    ('🧉', 'Mate', #$1F9C9),

    ('🧊', 'Ice', #$1F9CA),

    ('🥢', 'Chopsticks', #$1F962),

    ('🍽', 'Fork and knife with plate', #$1F37D),

    ('🍴', 'Fork and knife', #$1F374),

    ('🥄', 'Spoon', #$1F944),

    ('🔪', 'Kitchen knife', #$1F52A),

    ('🧋', 'Jar', #$1FAD9),

    ('🏺', 'Amphora', #$1F3FA),

    // Travel and Places Emojis

    ('🌍', 'Globe showing Africa and Europe', #$1F30D),

    ('🌎', 'Globe showing Americas', #$1F30E),

    ('🌏', 'Globe showing Asia and Australia', #$1F30F),

    ('🌐', 'Globe with meridians', #$1F310),

    ('🗺', 'World map', #$1F5FA),

    ('🧭', 'Compass', #$1F9ED),

    ('⛰', 'Mountain', #$26F0),

    ('🏔', 'Snowcap mountain', #$26F0),

    ('🌋', 'Volcanic mountain', #$1F30B),

    ('🗻', 'Fuji mountain', #$1F5FB),

    ('🏕', 'Camping', #$1F3D5),

    ('🏖', 'Beach with umbrella', #$1F3D6),

    ('🏜', 'Desert', #$1F3DC),

    ('🏝', 'Desertified island', #$1F3DD),

    ('🏞', 'National park', #$1F3DE),

    ('🏟', 'Stadium', #$1F3DF),

    ('🏛', 'Classical building', #$1F3DB),

    ('🏗', 'Building construction', #$1F3D7),

    ('🧱', 'Brick', #$1F9F1),

    ('🪨', 'Rock', #$1FAA8),

    ('🪵', 'Wood', #$1FAB5),

    ('🛖', 'Hut', #$1F6D6),

    ('🏘', 'Houses', #$1F3D8),

    ('🏚', 'Derelict house', #$1F3DA),

    ('🏠', 'House', #$1F3E0),

    ('🏡', 'House with garden', #$1F3E1),

    ('🏢', 'Office building', #$1F3E2),

    ('🏣', 'Japanese office', #$1F3E3),

    ('🏤', 'Post office', #$1F3E4),

    ('🏥', 'Hospital', #$1F3E5),

    ('🏦', 'Bank', #$1F3E6),

    ('🏨', 'Hotel', #$1F3E8),

    ('🏩', 'Love hotel', #$1F3E9),

    ('🏪', 'Convenience store', #$1F3EA),

    ('🏫', 'School', #$1F3EB),

    ('🏬', 'Department', #$1F3EC),

    ('🏭', 'Factory', #$1F3ED),

    ('🏯', 'Japanese castle', #$1F3EF),

    ('🏰', 'Castle', #$1F3F0),

    ('💒', 'Wedding house', #$1F492),

    ('🗼', 'Tokyo tower', #$1F5FC),

    ('🗽', 'Statue of liberty', #$1F5FD),

    ('⛪', 'Church', #$26EA),

    ('🕌', 'Mosque', #$1F54C),

    ('🛕', 'Hindu temple', #$1F6D5),

    ('🕍', 'Synagogue', #$1F54D),

    ('⛩', 'Shinto shrine', #$26E9),

    ('🕋', 'Kaaba', #$1F54B),

    ('⛲', 'Fountain', #$26F2),

    ('⛺', 'Tent', #$26FA),

    ('🌁', 'Foggy', #$1F301),

    ('🌃', 'Night with starrs', #$1F303),

    ('🏙', 'Citscape', #$1F3D9),

    ('🌅', 'Sunrise', #$1F305),

    ('🌄', 'Sunrise over mountains', #$1F304),

    ('🌆', 'Cityscape at dusk', #$1F306),

    ('🌇', 'Sunset', #$1F307),

    ('🌉', 'Bridge at night', #$1F309),

    ('♨', 'Hot springs', #$2668),

    ('🎠', 'Carousel horse', #$1F3A0),

    ('🎡', 'Ferris wheel', #$1F3A1),

    ('🎢', 'Roller coaster', #$1F3A2),

    ('💈', 'Barber poll', #$1F488),

    ('🎪', 'Circus tent', #$1F3AA),

    // Transport Emojis

    ('🚂', 'Locomotive', #$1F682),

    ('🚃', 'Railway car', #$1F683),

    ('🚄', 'High speed train', #$1F684),

    ('🚅', 'Bullet train', #$1F685),

    ('🚆', 'Train', #$1F686),

    ('🚇', 'Metro', #$1F687),

    ('🚈', 'Light rail', #$1F688),

    ('🚉', 'Station', #$1F689),

    ('🚊', 'Tram', #$1F68A),

    ('🚝', 'Monorail', #$1F69D),

    ('🚞', 'Mountain railway', #$1F69E),

    ('🚋', 'Tram car', #$1F68B),

    ('🚌', 'us', #$1F68C),

    ('🚍', 'Oncoming bus', #$1F68D),

    ('🚎', 'Trolley bus', #$1F68E),

    ('🚐', 'Minibus', #$1F690),

    ('🚑', 'Ambulance', #$1F691),

    ('🚒', 'Fire engine', #$1F692),

    ('🚓', 'Police car', #$1F693),

    ('🚔', 'Oncoming police car', #$1F694),

    ('🚕', 'Taxi', #$1F695),

    ('🚖', 'Oncoming taxi', #$1F696),

    ('🚗', 'Automobile', #$1F697),

    ('🚘', 'Oncoming automobile', #$1F698),

    ('🚙', 'Sport utility vehicle', #$1F699),

    ('🛻', 'Pickup truck', #$1F6FB),

    ('🚚', 'Delivery truck', #$1F69A),

    ('🚛', 'Articulated lorry', #$1F69B),

    ('🚜', 'Tractor', #$1F69C),

    ('🏎', 'Racing car', #$1F3CE),

    ('🏍', 'Motorcycle', #$1F3CD),

    ('🛵', 'Scooter', #$1F6F5),

    ('🦽', 'Manual wheelchair', #$1F9BD),

    ('🦼', 'Motorized wheelchair', #$1F9BC),

    // Time Emojis

    ('⌛', 'Hourglass done', #$231B),

    ('⏳', 'Hourglass starting', #$23F3),

    ('⌚', 'Watch', #$231A),

    ('⏰', 'Alarm', #$23F0),

    ('⏱', 'Stopwatch', #$23F1),

    ('⏲', 'Timer clock', #$23F2),

    ('🕰', 'Mantelpiece clock', #$1F570),

    ('🕛', 'Twelve O''clock ', #$1F55B),

    ('🕧', 'Twelve-thirty', #$1F567),

    ('🕐', 'One O''clock ', #$1F550),

    ('🕜', 'One-thirty', #$1F55C),

    ('🕑', 'Two O''clock ', #$1F551),

    ('🕝', 'Two-thirty', #$1F55D),

    ('🕒', 'Three O''clock ', #$1F552),

    ('🕞', 'Three-thirty', #$1F55E),

    ('🕓', 'Four O''clock ', #$1F553),

    ('🕟', 'Four-thirty', #$1F55F),

    ('🕔', 'Five O''clock ', #$1F554),

    ('🕠', 'Five-thirty', #$1F560),

    ('🕕', 'Six O''clock ', #$1F555),

    ('🕡', 'Six-thirty', #$1F561),

    ('🕖', 'Seven O''clock ', #$1F556),

    ('🕢', 'Seven-thirty', #$1F562),

    ('🕗', 'Eight O''clock ', #$1F557),

    ('🕣', 'Eight-thirty', #$1F563),

    ('🕘', 'Nine O''clock ', #$1F558),

    ('🕤', 'Nine-thirty', #$1F564),

    ('🕙', 'Ten O''clock ', #$1F559),

    ('🕥', 'Ten-thirty', #$1F565),

    ('🕚', 'Eleven O''clock ', #$1F55A),

    ('🕦', 'Eleven-thirty', #$1F566),

    // Sky and Weather Emojis

    ('🌑', 'New moon', #$1F311),

    ('🌒', 'Waxing crescent moon', #$1F312),

    ('🌓', 'First quarter moon', #$1F313),

    ('🌔', 'Waxing gibbous moon', #$1F314),

    ('🌕', 'Full moon', #$1F315),

    ('🌖', 'Waning gibbous moon', #$1F316),

    ('🌗', 'Last quarter moon', #$1F317),

    ('🌘', 'Waning crescent moon', #$1F318),

    ('🌙', 'Crescent moon', #$1F319),

    ('🌚', 'New moon face', #$1F31A),

    ('🌛', 'First quarter moon face', #$1F31B),

    ('🌜', 'Last quartermoon face', #$1F31C),

    ('🌡', 'Thermometer', #$1F321),

    ('☀', 'Sun', #$2600),

    ('🌝', 'Full moon face', #$1F31D),

    ('🌞', 'Sun with face', #$1F31E),

    ('🪐', 'Ringed planet', #$1FA90),

    ('⭐', 'Star', #$2B50),

    ('🌟', 'Glowing star', #$1F31F),

    ('🌠', 'Shooting star', #$1F320),

    ('🌌', 'Milky way', #$1F30C),

    ('☁', 'Cloud', #$2601),

    ('⛅', 'Sun behind cloud', #$26C5),

    ('⛈', 'Cloud with lighting and rain', #$26C8),

    ('🌤', 'Sun behind small cloud', #$1F324),

    ('🌥', 'Sun behind large cloud', #$1F325),

    ('🌦', 'Sun behind rain cloud', #$1F326),

    ('🌧', 'Cloud with rain', #$1F327),

    ('🌨', 'Cloud with snow', #$1F328),

    ('🌩', 'Cloud with lighting', #$1005),

    ('🌪', 'Tornado', #$1F32A),

    ('🌫', 'Fog', #$1F32B),

    ('🌬', 'Wind face', #$1F32C),

    ('🌀', 'Cyclone', #$1F300),

    ('🌈', 'Rainbow', #$1F308),

    ('🌂', 'Closed umbrella', #$1F302),

    ('☂', 'Umbrella', #$2602),

    ('☔', 'Umbrella with raindrops', #$2614),

    ('⛱', 'Umbrella on ground', #$26F1),

    ('⚡', 'High voltage', #$26A1),

    ('❄', 'Snowflake', #$2744),

    ('☃', 'Snowman', #$2603),

    ('⛄', 'Snowman without snow', #$26C4),

    ('☄', 'Comet', #$2604),

    ('🔥', 'Fire', #$1F525),

    ('💧', 'Droplet', #$1F4A7),

    ('🌊', 'Water wave', #$1F30A),

    // Activity Emojis

    ('🎃', 'Jack-o-lantern', #$1F383),

    ('🎄', 'Christmas tree', #$1F384),

    ('🎆', 'Fireworks', #$1F386),

    ('🎇', 'Sparkler', #$1F387),

    ('🧨', 'Firecracker', #$1F9E8),

    ('✨', 'Sparkles', #$2728),

    ('🎈', 'Baloon', #$1F388),

    ('🎉', 'Party popper', #$1F389),

    ('🎊', 'Confetti ball', #$1F38A),

    ('🎋', 'Tanabata tree', #$1F38B),

    ('🎍', 'Pine decoration', #$1F38D),

    ('🎎', 'Japanese dolls', #$1F38E),

    ('🎏', 'Carp streamer', #$1F38F),

    ('🎑', 'Moon viewing ceremony', #$1F391),

    ('🧧', 'Red envelope', #$1F9E7),

    ('🎀', 'Ribbon', #$1F380),

    ('🎁', 'Wrapped gift', #$1F381),

    ('🎗', 'Reminder ribbon', #$1F397),

    ('🎟', 'Admission ticket', #$1F39F),

    ('🎫', 'Ticket', #$1F3AB),

    // Award Medals Emojis

    ('🎖', 'Military medal', #$1F396),

    ('🏆', 'Trophy', #$1F3C6),

    ('🏅', 'Sports medal', #$1F3C5),

    ('🥇', 'Gold medal - first position', #$1F947),

    ('🥈', 'Silver medal - second position', #$1F948),

    ('🥉', 'Bronze medal - third position', #$1F949),

    // Sport Emojis

    ('⚽', 'Soccer ball', #$26BD),

    ('⚾', 'Baseball', #$26BE),

    ('🥎', 'Softball', #$1F94E),

    ('🏀', 'BAsketball', #$1F3C0),

    ('🏐', 'Volleyball', #$1F3D0),

    ('🏈', 'American football', #$1F3C8),

    ('🏉', 'Rugby', #$1F3C9),

    ('🎾', 'Tennis', #$1F3BE),

    ('🥏', 'Flying disk', #$1F94F),

    ('🎳', 'Bowling', #$1F3B3),

    ('🏏', 'Cricket', #$1F3CF),

    ('🏑', 'Field hockey', #$1F3D1),

    ('🏒', 'Ice hockey', #$1F3D2),

    ('🥍', 'Lacrose', #$1F94D),

    ('🏓', 'Ping pong', #$1F3D3),

    ('🏸', 'Badminton', #$1F3F8),

    ('🥊', 'Boxing glove', #$1F94A),

    ('🥋', 'Martial arts uniform', #$1F94B),

    ('🥅', 'Goal net', #$1F945),

    ('⛳', 'Flag in a hole', #$26F3),

    ('⛸', 'Ice skate', #$26F8),

    ('🎣', 'Fishing poll', #$1F3A3),

    ('🤿', 'Driving mask', #$1F93F),

    ('🎽', 'Running shirt', #$1F3BD),

    ('🎿', 'Skis', #$1F3BF),

    ('🛷', 'Sled', #$1F6F7),

    ('🥌', 'Curling stone', #$1F94C),

    // Games Emojis

    ('🎯', 'Bullseye', #$1F3AF),

    ('🪀', 'Yo-yo', #$1FA80),

    ('🪁', 'Kite', #$1FA81),

    ('🎱', '8 ball', #$1F3B1),

    ('🔮', 'Crystal ball', #$1F52E),

    ('🪄', 'Magic wand', #$1FA84),

    ('🧿', 'Nazar amulet', #$1F9FF),

    ('🪄', 'Hamsa', #$1FAAC),

    ('🎮', 'Video game pad', #$1F3AE),

    ('🕹', 'Joystick', #$1F579),

    ('🎰', 'Slot machine', #$1F3B0),

    ('🎲', 'Game die', #$1F3B2),

    ('🧩', 'Puxxle piece', #$1F9E9),

    ('🧸', 'Teddy bear', #$1F9F8),

    ('🪅', 'Pinata', #$1FA85),

    ('🪆', 'Mirror', #$1FAA9),

    ('🪆', 'Nesting doll', #$1FA86),

    ('♠', 'Spade suit', #$2660),

    ('♥', 'Heart suit', #$2665),

    ('♣', 'Club suit', #$2663),

    ('♟', 'Chess pawn', #$265F),

    ('🃏', 'Joker', #$1F0CF),

    ('🀄', 'Mahjong red dragon', #$1F004),

    ('🎴', 'Flower playing cards', #$1F3B4),

    // Arts and Crafts Emojis

    ('🎭', 'Performing arts', #$1F3AD),

    ('🖼', 'Framed picture', #$1F5BC),

    ('🎨', 'Artist pallete', #$1F3A8),

    ('🧵', 'Thread', #$1F9F5),

    ('🪡', 'Sewing needle with thred', #$1FAA1),

    ('🧶', 'Yarn', #$1F9F6),

    ('🪢', 'Knot', #$1FAA2),

    // Clothing Objects Emojis

    ('👓', 'Glasses', #$1F453),

    ('🕶', 'Sunglasses', #$1F576),

    ('🥽', 'Googles', #$1F97D),

    ('🥼', 'Lab coat', #$1F97C),

    ('🦺', 'Safety vest', #$1F9BA),

    ('👔', 'Necktie', #$1F454),

    ('👕', 'T-shirt', #$1F455),

    ('👖', 'Jeans', #$1F456),

    ('🧣', 'Scarf', #$1F9E3),

    ('🧤', 'Gloves', #$1F9E4),

    ('🧥', 'Coat', #$1F9E5),

    ('🧦', 'Socks', #$1F9E6),

    ('👗', 'Dress', #$1F457),

    ('👘', 'Kimono', #$1F458),

    ('🥻', 'Sari', #$1F97B),

    ('🩱', 'One piece suit', #$1FA71),

    ('🩲', 'Briefs', #$1FA72),

    ('🩳', 'Shorts', #$1FA73),

    ('👙', 'Bikini', #$1F459),

    ('👚', 'Woman''s cloth ', #$1F45A),

    ('👛', 'Purse', #$1F45B),

    ('👜', 'Handbag', #$1F45C),

    ('👝', 'Clutch bag', #$1F45D),

    ('🛍', 'Shopping bags', #$1F6CD),

    ('🎒', 'Backpack', #$1F392),

    ('🩴', 'Thong sandals', #$1FA74),

    ('👞', 'Man''s shoe', #$1F45E),

    ('👟', 'Running shoe', #$1F45F),

    ('🥾', 'Hiking boot', #$1F97E),

    ('🥿', 'Flat shoe', #$1F97F),

    ('👠', 'High-heeled shoe', #$1F460),

    ('👡', 'Woman''s sandal ', #$1F461),

    ('🩰', 'Ballet shoes', #$1FA70),

    ('👢', 'Woman''s boot ', #$1F462),

    ('👑', 'Crown', #$1F451),

    ('👒', 'Woman''s hat ', #$1F452),

    ('🎩', 'Top hat', #$1F3A9),

    ('🎓', 'Graduation cap', #$1F393),

    ('🧢', 'Billed cap', #$1F9E2),

    ('🪖', 'Military helmet', #$1FA96),

    ('⛑', 'Rescuew worker''s helmet', #$26D1),

    ('📿', 'PRayer beads', #$1F4FF),

    ('💄', 'Lipstick', #$1F484),

    ('💍', 'Ring', #$1F48D),

    ('💎', 'Gemstone', #$1F48E),

    // Sound Emojis

    ('🔇', 'Muted speaker', #$1F507),

    ('🔈', 'Low volume speaker', #$1F508),

    ('🔉', 'Mid volume speaker', #$1F509),

    ('🔊', 'High volume speaker', #$1F50A),

    ('📢', 'Loudspeaker', #$1F4E2),

    ('📣', 'Megaphone', #$1F4E3),

    ('📯', 'Postal horn', #$1F4EF),

    ('🔔', 'Bell', #$1F514),

    ('🔕', 'Bell with slash', #$1F515),

    ('🎼', 'Musical score', #$1F3BC),

    ('🎵', 'Musical note', #$1F3B5),

    ('🎶', 'Musical notes', #$1F3B6),

    ('🎙', 'Studio microphone', #$1F399),

    ('🎚', 'Level slider', #$1F39A),

    ('🎛', 'Control knobs', #$1F39B),

    ('🎤', 'Microphone', #$1F3A4),

    ('🎧', 'Headphone', #$1F3A7),

    ('📻', 'Radio', #$1F4FB),

    // Musical Instrument Emojis

    ('🎷', 'Saxophone', #$1F3B7),

    ('🪗', 'Accordion', #$1FA97),

    ('🎸', 'Guitar', #$1F3B8),

    ('🎹', 'Musical keyboard', #$1F3B9),

    ('🎺', 'Trumpet', #$1F3BA),

    ('🎻', 'Violin', #$1F3BB),

    ('🪕', 'Banjo', #$1FA95),

    ('🥁', 'Drum', #$1F941),

    ('🪘', 'Long drum', #$1FA98),

    // Phone Emojis

    ('📱', 'Mobile phone', #$1F4F1),

    ('📲', 'MObile phone with arrow', #$1F4F2),

    ('☎', 'Telephone', #$260E),

    ('📞', 'Telephone receiver', #$1F4DE),

    ('📟', 'Pager', #$1F4DF),

    ('📠', 'Fax machine', #$1F4E0),

    // Computer Emojis

    ('🔋', 'Full battery', #$1F50B),

    ('🪫', 'Low battery', #$1FAAB),

    ('🔌', 'Electric plug', #$1F50C),

    ('💻', 'Laptop', #$1F4BB),

    ('🖥', 'Desktop computer', #$1F5A5),

    ('🖨', 'Printer', #$1F5A8),

    ('⌨', 'Keyboard', #$2328),

    ('🖱', 'Mouse', #$1F5B1),

    ('🖲', 'Trackball', #$1F5B2),

    ('💽', 'Computer disk', #$1F4BD),

    ('💾', 'Floppy disk', #$1F4BE),

    ('💿', 'Optical disk', #$1F4BF),

    ('📀', 'DVD', #$1F4C0),

    ('🧮', 'Abacus', #$1F9EE),

    // Light and Video Emojis

    ('🎥', 'Movie camera', #$1F3A5),

    ('🎞', 'Film frames', #$1F39E),

    ('📽', 'Film Projector', #$1F4FD),

    ('🎬', 'Clapper board', #$1F3AC),

    ('📺', 'Television', #$1F4FA),

    ('📷', 'Camera', #$1F4F7),

    ('📸', 'Camera with flash', #$1F4F8),

    ('📹', 'Video camera', #$1F4F9),

    ('📼', 'Video cassete', #$1F4FC),

    ('🔍', 'Magnifying glass tilted left', #$1F50D),

    ('🔎', 'Magnifying glass tilted right', #$1F50E),

    ('🕯', 'Candle', #$1F56F),

    ('💡', 'Light bulb', #$1F4A1),

    ('🔦', 'Flashlight', #$1F526),

    ('🏮', 'Red pepper lantern', #$1F3EE),

    ('🪔', 'Diya lamp', #$1FA94),

    // Book and Paper Emojis

    ('📔', 'Notebook with decorative cover', #$1F4D4),

    ('📕', 'Closed notebook', #$1F4D5),

    ('📖', 'Opened notebook', #$1F4D6),

    ('📗', 'Green book', #$1F4D7),

    ('📘', 'Blue book', #$1F4D8),

    ('📙', 'Orange book', #$1F4D9),

    ('📚', 'Orange books', #$1F4DA),

    ('📓', 'Notebook', #$1F4D3),

    ('📒', 'Ledger', #$1F4D2),

    ('📃', 'Page with curl', #$1F4C3),

    ('📜', 'Scroll', #$1F4DC),

    ('📄', 'Page facing up', #$1F4C4),

    ('📰', 'Newspaper', #$1F4F0),

    ('🗞', 'Rolled-up newspaper', #$1F5DE),

    ('📑', 'Bookmark tabs', #$1F4D1),

    ('🔖', 'Bookmark', #$1F516),

    ('🏷', 'Label', #$1F3F7),

    ('💰', 'Money bag', #$1F4B0),

    ('🪙', 'Coin', #$1FA99),

    ('💴', 'Yen banknote', #$1F4B4),

    ('💵', 'Dollar banknote', #$1F4B5),

    ('💶', 'Euro banknote', #$1F4B6),

    ('💷', 'Pound banknote', #$1F4B7),

    ('💸', 'Money with wings', #$1F4B8),

    ('💳', 'Credit card', #$1F4B3),

    ('🧾', 'Receipt', #$1F9FE),

    ('💹', 'Chart increase woth Yen', #$1F4B9),

    // Mail Emojis

    ('✉', 'Envelope', #$2709),

    ('📧', 'e-mail', #$1F4E7),

    ('📩', 'Envelope with arrow', #$1F4E9),

    ('📤', 'Outbox tray', #$1F4E4),

    ('📥', 'Inbox tray', #$1F4E5),

    ('📦', 'Package', #$1F4E6),

    ('📫', 'Closed mailbox with raised flag', #$1F4EB),

    ('📪', 'Closed mailbox with lowered flag', #$1F4EA),

    ('📬', 'Open mailbox with raised flag', #$1F4EC),

    ('📭', 'Open mailbox with lowered flag', #$1F4ED),

    ('📮', 'Postbox', #$1F4EE),

    ('🗳', 'Ballot box with ballot', #$1F5F3),

    // Writing

    ('✏', 'Pencil', #$270F),

    ('✒', 'Black nib', #$2712),

    ('🖋', 'Fountain pen', #$1F58B),

    ('🖊', 'Pen', #$1F58A),

    ('🖌', 'Paintbrush', #$1F58C),

    ('🖍', 'Crayon', #$1F58D),

    ('📝', 'Memo', #$1F4DD),

    // Office Emojis

    ('💼', 'Briefcase', #$1F4BC),

    ('📁', 'File folder', #$1F4C1),

    ('📂', 'Open the folder', #$1F4C2),

    ('🗂', 'Card index dividers', #$1F5C2),

    ('📅', 'Calender', #$1F4C5),

    ('📆', 'Tear off calender', #$1F4C6),

    ('📇', 'Card index', #$1F4C7),

    ('📈', 'Increasing chart', #$1F4C8),

    ('📉', 'Decreasing chart', #$1F4C9),

    ('📊', 'Bar chart', #$1F4CA),

    ('📋', 'Clipboard', #$1F4CB),

    ('📌', 'Pushpin', #$1F4CC),

    ('📍', 'Round pushpin', #$1F4CD),

    ('📎', 'Paperclip', #$1F4CE),

    ('🖇', 'Linked paperclips', #$1F587),

    ('📏', 'Straight ruler', #$1F4CF),

    ('📐', 'Triangular ruler', #$1F4D0),

    ('✂', 'Scissors', #$2702),

    ('🗃', 'Card file box', #$1F5C3),

    ('🗄', 'File cabinet', #$1F5C4),

    ('🗑', 'Waste basket', #$1F5D1),

    // Lock Emojis

    ('🔒', 'Locked', #$1F512),

    ('🔓', 'Unlocked', #$1F513),

    ('🔏', 'Locked with pen', #$1F50F),

    ('🔐', 'Locked with key', #$1F510),

    ('🔑', 'Key', #$1F511),

    ('🗝', 'Old key', #$1F5DD),

    // Tools Emojis

    ('🔨', 'Hammer', #$1F528),

    ('🪓', 'Axe', #$1FA93),

    ('⛏', 'Pick', #$26CF),

    ('⚒', 'Hammer and pick', #$2692),

    ('🛠', 'Hammer and wrench', #$1F6E0),

    ('🗡', 'Sword', #$1F5E1),

    ('⚔', 'Crossed swords', #$2694),

    ('🔫', 'Water gun', #$1F52B),

    ('🪃', 'Boomerang', #$1FA83),

    ('🏹', 'Bow and arrow', #$1F3F9),

    ('🛡', 'Shield', #$1F6E1),

    ('🪚', 'Carpentry saw', #$1FA9A),

    ('🔧', 'Wrench', #$1F527),

    ('🪛', 'Screwdriver', #$1FA9B),

    ('🔩', 'Bolt and nut', #$1F529),

    ('⚙', 'Wheel', #$2699),

    ('🗜', 'Clamp', #$1F5DC),

    ('⚖', 'Balance scale', #$2696),

    ('🦯', 'White cane', #$1F9AF),

    ('🔗', 'Link', #$1F517),

    ('⛓', 'Chains', #$26D3),

    ('🪝', 'Hook', #$1FA9D),

    ('🧰', 'Toolbox', #$1F9F0),

    ('🧲', 'Magnet', #$1F9F2),

    ('🪜', 'Ladder', #$1FA9C),

    // Science Emojis

    ('⚗', 'Alembic', #$2697),

    ('🧪', 'Test tube', #$1F9EA),

    ('🧫', 'Petri dish', #$1F9EB),

    ('🧬', 'DNA', #$1F9EC),

    ('🔬', 'Microscope', #$1F52C),

    ('🔭', 'Telescope', #$1F52D),

    ('📡', 'Satelite antenna', #$1F4E1),

    // Medical Emojis

    ('💉', 'Syringe', #$1F489),

    ('🩸', 'A droplet of blood', #$1FA78),

    ('💊', 'Pill', #$1F48A),

    ('🩹', 'Adhesive bandage', #$1FA79),

    ('🩼', 'Clutch', #$1FA7C),

    ('🩺', 'Stethoscope', #$1FA7A),

    ('🩻', 'X-ray', #$1FA7B),

    // Household Emojis

    ('🚪', 'Door', #$1F6AA),

    ('🛗', 'Elevator', #$1F6D7),

    ('🪞', 'Mirror', #$1FA9E),

    ('🪟', 'Window', #$1FA9F),

    ('🛏', 'Bed', #$1F6CF),

    ('🛋', 'Couch and lamp', #$1F6CB),

    ('🪑', 'Chair', #$1FA91),

    ('🚽', 'Toilet', #$1F6BD),

    ('🪠', 'Plunger', #$1FAA0),

    ('🚿', 'Shower', #$1F6BF),

    ('🛁', 'Bathtub', #$1F6C1),

    ('🪤', 'Mouse trap', #$1FAA4),

    ('🪒', 'Razor', #$1FA92),

    ('🧴', 'Lotion bottle', #$1F9F4),

    ('🧷', 'Safety pin', #$1F9F7),

    ('🧹', 'Broom', #$1F9F9),

    ('🧺', 'Basket', #$1F9FA),

    ('🧻', 'Roll of paper', #$1F9FB),

    ('🪣', 'Bucket', #$1FAA3),

    ('🧼', 'Soap', #$1F9FC),

    ('🫧', 'Bubbles', #$1FAE7),

    ('🪥', 'Toothbrush', #$1FAA5),

    ('🧽', 'Sponge', #$1F9FD),

    ('🧯', 'Fire extinguisher', #$1F9EF),

    ('🛒', 'Shopping cart', #$1F6D2),

    // Other Objects Emojis

    ('🚬', 'Cigarette', #$1F6AC),

    ('⚰', 'Casket', #$26B0),

    ('🪦', 'Headstone', #$1FAA6),

    ('⚱', 'Funeral urn', #$26B1),

    ('🗿', 'Mole', #$1F5FF),

    ('🪧', 'Placard', #$1FAA7),

    ('🪪', 'ID Card', #$1FAAA),

    // Symbols

    ('🏧', 'ATM Sign', #$1F3E7),

    ('🚮', 'Litter in bin', #$1F6AE),

    ('🚰', 'Portable water', #$1F6B0),

    ('♿', 'Wheelchair symbol', #$267F),

    ('🚹', 'Men''s room symbol', #$1F6B9),

    ('🚺', 'Women''s room symbol ', #$1F6BA),

    ('🚻', 'Restroom symbol', #$1F6BB),

    ('🚼', 'Baby symbol', #$1F6BC),

    ('🚾', 'Water closet', #$1F6BE),

    ('🛂', 'Passport control', #$1F6C2),

    ('🛂', 'Customs', #$1F6C3),

    ('🛄', 'Baggage claim', #$1F6C4),

    ('🛅', 'Left laugage', #$1F6C5),

    // Warning Emojis

    ('⚠', 'Warning', #$26A0),

    ('🚸', 'Children crossing', #$1F6B8),

    ('⛔', 'No entry', #$26D4),

    ('🚫', 'Prohibited', #$1F6AB),

    ('🚳', 'No bicycles', #$1F6B3),

    ('🚭', 'No smoking', #$1F6AD),

    ('🚯', 'No littering', #$1F6AF),

    ('🚱', 'Non-portable water', #$1F6B1),

    ('🚷', 'No pedestrians', #$1F6B7),

    ('📵', 'No mobile phones', #$1F4F5),

    ('🔞', 'No one under 18', #$1F51E),

    ('☢', 'Radioactive', #$2622),

    ('☣', 'Biohazard', #$2623),

    // Arrow Emojis

    ('⬆', 'Up Arrow', #$2B06),

    ('↗', 'Up-right arrow', #$2197),

    ('➡', 'Right arrow', #$27A1),

    ('↘', 'Down-right arrow', #$2198),

    ('⬇', 'Down arrow', #$2B07),

    ('↙', 'Down-left arrow', #$2199),

    ('⬅', 'Left arrow', #$2B05),

    ('↖', 'Up-left arrow', #$2196),

    ('↕', 'Up-down arrow', #$2195),

    ('↔', 'Left arrow', #$2194),

    ('↩', 'Right arrow curving left', #$21A9),

    ('↪', 'Left arrow curving right', #$21AA),

    ('⤴', 'Right arrow curving up', #$2934),

    ('⤵', 'Right arrow curving down', #$2935),

    ('🔃', 'Clockwise vertical arrow', #$1F503),

    ('🔄', 'Counterclockwise arrows button', #$1F504),

    ('🔙', 'Back arrow', #$1F519),

    ('🔚', 'End arrow', #$1F51A),

    ('🔛', 'On arrow', #$1F51B),

    ('🔜', 'Soon arrow', #$1F51C),

    ('🔝', 'Top arrow', #$1F51D),

    // Religion

    ('🛐', 'Place of worship', #$1F6D0),

    ('⚛', 'Atom symbol', #$269B),

    ('🕉', 'OM', #$1F549),

    ('✡', 'Star of David', #$2721),

    ('☸', 'Wheel of Dharma', #$2638),

    ('☯', 'Yin yang', #$262F),

    ('✝', 'Latin cross', #$271D),

    ('☦', 'ORthodox cross', #$2626),

    ('☪', 'Star and cresent moon', #$262A),

    ('☮', 'Peace', #$262E),

    ('🕎', 'Menorah', #$1F54E),

    ('🔯', 'Six-pointed star', #$1F52F),

    // Zodiac

    ('♈', 'Aries', #$2648),

    ('♉', 'Taurus', #$2649),

    ('♊', 'Gemini', #$264A),

    ('♋', 'Cancer', #$264B),

    ('♌', 'Leo', #$264C),

    ('♍', 'Virgo', #$264D),

    ('♎', 'Libra', #$264E),

    ('♏', 'Scorpio', #$264F),

    ('♐', 'Sagittarius', #$2650),

    ('♑', 'Capricon', #$2651),

    ('♒', 'Acquarius', #$2652),

    ('♓', 'Pisces', #$2653),

    ('⛎', 'Ophiucus', #$26CE),

    // AV Symbols

    ('🔀', 'Shuffle tracks', #$1F500),

    ('🔁', 'Repeat all', #$1F501),

    ('🔂', 'Repeat one', #$1F502),

    ('▶', 'Play', #$25B6),

    ('⏸', 'Pause', #$23F8),

    ('⏩', 'Fast-forward', #$23E9),

    ('⏭', 'Next track', #$23ED),

    ('⏯', 'Play or pause', #$23EF),

    ('◀', 'Reverse', #$25C0),

    ('⏪', 'Fast-reverse', #$23EA),

    ('⏮', 'Previous track', #$23EE),

    ('🔼', 'Upwards', #$1F53C),

    ('⏫', 'Fst-up', #$23EB),

    ('🔽', 'Downwards', #$1F53D),

    ('⏬', 'Fast down', #$23EC),

    ('⏹', 'Stop', #$23F9),

    ('⏺', 'Record', #$23FA),

    ('⏏', 'Eject', #$23CF),

    ('🎦', 'Cinema', #$1F3A6),

    ('🔅', 'Dim', #$1F505),

    ('🔆', 'Bright', #$1F506),

    ('📶', 'Network antenna bars', #$1F4F6),

    ('📳', 'Vibration mode', #$1F4F3),

    ('📴', 'Mobile phone off', #$1F4F4),

    // Gender

    ('♀', 'Female', #$2640),

    ('♂', 'Male', #$2642),

    ('⚧', 'Transgender', #$26A7),

    // Math Symbols

    ('✖', 'Times', #$2716),

    ('➕', 'Plus', #$2795),

    ('➖', 'Minus', #$2796),

    ('➗', 'Divide', #$2797),

    ('🟰', 'Equals', #$1F7F0),

    ('♾', 'Infinity', #$267E),

    // Punctuation Symbols

    ('‼', 'Double exclamation', #$203C),

    ('⁉', 'Exclamation and question mark', #$2049),

    ('❓', 'Red question mark', #$2753),

    ('❔', 'White question mark', #$2754),

    ('❗', 'Red exclamation mark', #$2757),

    ('❕', 'White exclamation mark', #$2755),

    ('〰', 'Wavy dash', #$3030),

    // Currency

    ('💱', 'Currency exchange', #$1F4B1),

    ('💲', 'Heavy green dollar sign', #$1F4B2),

    // Other Symbols

    ('⚕', 'Medical symbol', #$2695),

    ('♻', 'Recycling symbol', #$267B),

    ('⚜', 'Fleur-de-lis', #$269C),

    ('🔱', 'Trident', #$1F531),

    ('📛', 'Name badge', #$1F4DB),

    ('🔰', 'Japanese symbol for beginner', #$1F530),

    ('⭕', 'Hollow red circle', #$2B55),

    ('✅', 'Green box with checkmark', #$2705),

    ('☑', 'Blue box with checkmark', #$2611),

    ('✔', 'Checkmark', #$2714),

    ('❌', 'Crossmark', #$274C),

    ('❎', 'Green crossmark', #$274E),

    ('➰', 'Curly loop', #$27B0),

    ('➿', 'Double curly loop', #$27BF),

    ('〽', 'PArt alternation mark', #$303D),

    ('✳', 'Eight-spoked asterik', #$2733),

    ('✴', 'Eight-pointed star', #$2734),

    ('❇', 'Sparkle', #$2747),

    ('©', 'Copyright symbol', #$00A9),

    ('®', 'Registered', #$00AE),

    ('™', 'Trademark', #$2122),

    // Keycap

    ('#️⃣', '# Keycap', #$20E3),

    ('*️⃣', '* Keycap', #$20E3),

    ('0️⃣', '0 Keycap', #$20E3),

    ('1️⃣', '1 Keycap', #$20E3),

    ('2️⃣', '2 Keycap', #$20E3),

    ('3️⃣', '3 Keycap', #$20E3),

    ('4️⃣', '4 Keycap', #$20E3),

    ('5️⃣', '5 Keycap', #$20E3),

    ('6️⃣', '6 Keycap', #$20E3),

    ('7️⃣', '7 Keycap', #$20E3),

    ('8️⃣', '8 Keycap', #$20E3),

    ('9️⃣', '9 Keycap', #$20E3),

    ('🔟', '10 Keycap', #$1F51F),

    // Alphanum Symbols

    ('🔠', 'Input Latin uppercase', #$1F520),

    ('🔡', 'Input Latin lowercase', #$1F521),

    ('🔢', 'Input numbers', #$1F522),

    ('🔣', 'Input symbols', #$1F523),

    ('🔤', 'Input Latin letters', #$1F524),

    ('🅰', 'A blood type', #$1F170),

    ('🆎', 'AB blood type', #$1F18E),

    ('🅱', 'B blood type', #$1F171),

    ('🅾', 'O blood type', #$1F17E),

    ('🆑', 'CL button', #$1F191),

    ('🆒', 'Cool button', #$1F192),

    ('🆓', 'Free button', #$1F193),

    ('ℹ', 'Info button', #$2139),

    ('🆔', 'ID button', #$1F194),

    ('Ⓜ', 'Circled M', #$24C2),

    ('🆕', 'New button', #$1F195),

    ('🆖', 'NG button', #$1F196),

    ('🆗', 'OK button', #$1F197),

    ('🅿', 'P button', #$1F17F),

    ('🆘', 'SOS button', #$1F198),

    ('🆙', 'UP! button', #$1F199),

    ('🆚', 'VS Button', #$1F19A),

    // Japanese Buttons

    ('🈁', 'Japanese "here" button', #$1F201),

    ('🈂', 'Japanese "service charge" button', #$1F202),

    ('🈷', 'Japanese "monthly amount" button', #$1F237),

    ('🈶', 'Japanese "not free of charge" button', #$1F236),

    ('🈯', 'Japanese "reserved" button', #$1F22F),

    ('🉐', 'Japanese "bargain" button', #$1F250),

    ('🈹', 'Japanese "discount" button', #$1F239),

    ('🈚', 'Japanese "free of charge" button', #$1F21A),

    ('🈲', 'Japanese "prohibited" button', #$1F232),

    ('🉑', 'Japanese "acceptable" button', #$1F251),

    ('🈸', 'Japanese "application" button', #$1F238),

    ('🈴', 'Japanese "passing grade" button', #$1F234),

    ('🈳', 'Japanese "vacancy" button', #$1F233),

    ('㊗', 'Japanese "congratulations" button', #$3297),

    ('㊙', 'Japanese "secret" button', #$3299),

    ('🈺', 'Japanese "open for business" button', #$1F23A),

    ('🈵', 'Japanese "no vacancy" button', #$1F235),

    // Geometric Emojis

    ('🔴', 'Red circle', #$1F534),

    ('🟠', 'Orange circle', #$1F7E0),

    ('🟡', 'Yellow circle', #$1F7E1),

    ('🟢', 'Green circle', #$1F7E2),

    ('🔵', 'Blue circle', #$1F535),

    ('🟣', 'Purple circle', #$1F7E3),

    ('🟤', 'Brown circle', #$1F7E4),

    ('⚫', 'Black circle', #$26AB),

    ('⚪', 'White circle', #$26AA),

    ('🟥', 'Red square', #$1F7E5),

    ('🟧', 'Orange square', #$1F7E5),

    ('🟨', 'Yellow square', #$1F7E8),

    ('🟩', 'Green square', #$1F7E9),

    ('🟦', 'Blue square', #$1F7E6),

    ('🟪', 'Purple square', #$1F7EA),

    ('🟫', 'Brown square', #$1F7EB),

    ('⬛', 'Black square', #$2B1B),

    ('⬜', 'White square', #$2B1C),

    ('🔶', 'Large orange diamond', #$1F536),

    ('🔷', 'Large blue diamond', #$1F537),

    ('🔸', 'Small orange diamond', #$1F538),

    ('🔹', 'Small blue diamond', #$1F539),

    ('🔺', 'Red triangle pointed up', #$1F53A),

    ('🔻', 'Red triangle pointed down', #$1F53B),

    ('💠', 'Diamond with a dot', #$1F4A0),

    ('🔘', 'Radio button', #$1F518),

    ('🔳', 'White square button', #$1F533),

    ('🔲', 'Black square button', #$1F532),

    // Flags

    ('🏁', 'Chequered flag', #$1F3C1),

    ('🚩', 'Triangular flag', #$1F6A9),

    ('🎌', 'Crossed flag', #$1F38C),

    ('🏴', 'Black flag', #$1F3F4),

    ('🏳', 'White flag', #$1F3F3),

    ('🏳️‍🌈', 'Rainbow flag', #$1F308),

    ('🏳️‍⚧️', 'Transgender flag', #$FE0F),

    ('🏴‍☠️', 'Pirate flag', #$2620),

    // Country Flags

    ('🇦🇨', 'Ascension Island flag', #$1F1E8),

    ('🇦🇩', 'Andorra flag', #$1F1E9),

    ('🇦🇪', 'UAE flag', #$1F1EA),

    ('🇦🇫', 'Afghanistan flag', #$1F1EB),

    ('🇦🇬', 'Antigua and Berbuda flag', #$1F1EC),

    ('🇦🇮', 'Anguila flag', #$1F1EE),

    ('🇦🇱', 'Albania flag', #$1F1F1),

    ('🇦🇲', 'Armenia flag', #$1F1F2),

    ('🇦🇴', 'Angola flag', #$1F1F4),

    ('🇦🇶', 'Antarctica flag', #$1F1F6),

    ('🇦🇷', 'Argentina flag', #$1F1F7),

    ('🇦🇸', 'American Samoa flag', #$1F1F8),

    ('🇦🇹', 'Austria flag', #$1F1F9),

    ('🇦🇺', 'Australia flag', #$1F1FA),

    ('🇦🇼', 'Aruba flag', #$1F1FC),

    ('🇦🇽', 'Åland Islands flag', #$1F1FD),

    ('🇦🇿', 'Azerbaijan flag', #$1F1FF),

    ('🇧🇦', 'Bosnia flag', #$1F1E6),

    ('🇧🇧', 'Barbados flag', #$1F1E7),

    ('🇧🇩', 'Bangladesh flag', #$1F1E9),

    ('🇧🇪', 'Belgium flag', #$1F1EA),

    ('🇧🇫', 'Burkina Faso flag', #$1F1EB),

    ('🇧🇬', 'Bulgaria flag', #$1F1EC),

    ('🇧🇭', 'Bahrain flag', #$1F1ED),

    ('🇧🇮', 'Burundi flag', #$1F1EE),

    ('🇧🇯', 'Benin Republic flag', #$1F1EF),

    ('🇧🇱', 'St. Barthélemy', #$1F1F1),

    ('🇧🇲', 'Bermuda flag', #$1F1F2),

    ('🇧🇳', 'Brunei flag', #$1F1F3),

    ('🇧🇴', 'Bolivia flag', #$1F1F4),

    ('🇧🇶', 'Caribbean Netherlands flag', #$1F1F6),

    ('🇧🇷', 'Brazil flag', #$1F1F7),

    ('🇧🇸', 'Bahamas flag', #$1F1F8),

    ('🇧🇹', 'Bhutan flag', #$1F1F9),

    ('🇧🇻', 'Bouvet Island flag', #$1F1FB),

    ('🇧🇼', 'Botswana flag', #$1F1FC),

    ('🇧🇾', 'Belarus flag', #$1F1FE),

    ('🇧🇿', 'Belize flag', #$1F1FF),

    ('🇨🇦', 'Canada flag', #$1F1E6),

    ('🇨🇨', 'Cocos Islands flag', #$1F1E8),

    ('🇨🇩', 'Congo DR flag', #$1F1E9),

    ('🇨🇫', 'CAR (Central African Republic) flag', #$1F1EB),

    ('🇨🇬', 'Congo Brazzaville flag', #$1F1EC),

    ('🇨🇭', 'Switzerland flag', #$1F1ED),

    ('🇨🇮', 'Côte d’Ivoire flag', #$1F1EE),

    ('🇨🇰', 'Cook Islands flag', #$1F1F0),

    ('🇨🇱', 'Chile flag', #$1F1F1),

    ('🇨🇲', 'Cameroun flag', #$1F1F2),

    ('🇨🇳', 'China flag', #$1F1F3),

    ('🇨🇴', 'Columbia flag', #$1F1F4),

    ('🇨🇵', 'Clipperton Island flag', #$1F1F5),

    ('🇨🇷', 'Costa Rica flag', #$1F1F7),

    ('🇨🇺', 'Cuba flag', #$1F1FA),

    ('🇨🇻', 'Cape Verde Island flag', #$1F1FB),

    ('🇨🇼', 'Curaçao flag', #$1F1FC),

    ('🇨🇽', 'Christmas Island flag', #$1F1FD),

    ('🇨🇾', 'Cyprus flag', #$1F1FE),

    ('🇩🇪', 'Germany flag', #$1F1EA),

    ('🇩🇬', 'Diego Garcia flag', #$1F1EC),

    ('🇩🇯', 'Djibouti flag', #$1F1EF),

    ('🇩🇰', 'Denmark flag', #$1F1F0),

    ('🇩🇲', 'Dominica flag', #$1F1F2),

    ('🇩🇴', 'Dominican Republic flag', #$1F1F4),

    ('🇩🇿', 'Algeria flag', #$1F1FF),

    ('🇪🇦', 'Ceuta &amp; Melilla flag', #$1F1E6),

    ('🇪🇨', 'Ecuador flag', #$1F1E8),

    ('🇪🇪', 'Estonia', #$1F1EA),

    ('🇪🇬', 'Egypt flag', #$1F1EC),

    ('🇪🇭', 'Western Sahara flag', #$1F1ED),

    ('🇪🇷', 'Eritrea flag', #$1F1F7),

    ('🇪🇸', 'Spain flag', #$1F1F8),

    ('🇪🇹', 'Ethiopia flag', #$1F1F9),

    ('🇪🇺', 'EU flag', #$1F1FA),

    ('🇫🇮', 'Finland flag', #$1F1EE),

    ('🇫🇯', 'Fiji flag', #$1F1EF),

    ('🇫🇰', 'Falkland Island flag', #$1F1F0),

    ('🇫🇲', 'Micronesia flag', #$1F1F2),

    ('🇫🇴', 'Faroe Island flag', #$1F1F4),

    ('🇫🇷', 'France flag', #$1F1F7),

    ('🇬🇦', 'Gabon flag', #$1F1E6),

    ('🇬🇧', 'United Kingdom flag', #$1F1E7),

    ('🇬🇩', 'Grenada flag', #$1F1E9),

    ('🇬🇪', 'Georgia flag', #$1F1EA),

    ('🇬🇫', 'French Guiana flag', #$1F1EB),

    ('🇬🇬', 'Guernsey flag', #$1F1EC),

    ('🇬🇭', 'Ghana flag', #$1F1ED),

    ('🇬🇮', 'Gibraltar flag', #$1F1EE),

    ('🇬🇱', 'Greenland flag', #$1F1F1),

    ('🇬🇲', 'Gambia flag', #$1F1F2),

    ('🇬🇳', 'Guinea flag', #$1F1F3),

    ('🇬🇵', 'Guadeloupe flag', #$1F1F5),

    ('🇬🇶', 'Equitorial Guinea flag', #$1F1F6),

    ('🇬🇷', 'Greece flag', #$1F1F7),

    ('🇬🇸', 'South Georgia &amp; South Sandwich Islands flag', #$1F1F8),

    ('🇬🇹', 'Guatemala flag', #$1F1F9),

    ('🇬🇺', 'Guam flag', #$1F1EC + #$1F1FA),

    ('🇬🇼', 'Guinea Bissau flag', #$1F1FC),

    ('🇬🇾', 'Guyana flag', #$1F1FE),

    ('🇭🇰', 'Hong Kong flag', #$1F1F0),

    ('🇭🇲', 'Heard &amp; McDonald Islands flag', #$1F1F2),

    ('🇭🇳', 'Honduras flag', #$1F1F3),

    ('🇭🇷', 'Croatia flag', #$1F1F7),

    ('🇭🇹', 'Haiti flag', #$1F1F9),

    ('🇭🇺', 'Hungary flag', #$1F1FA),

    ('🇮🇨', 'Canary Islands flag', #$1F1E8),

    ('🇮🇩', 'Indonesia flag', #$1F1E9),

    ('🇮🇪', 'Island flag', #$1F1EA),

    ('🇮🇱', 'Israel flag', #$1F1F1),

    ('🇮🇲', 'Isle of Man flag', #$1F1F2),

    ('🇮🇳', 'India flag', #$1F1F3),

    ('🇮🇴', 'British Indian Ocean Territory flag', #$1F1F4),

    ('🇮🇶', 'Iraq flag', #$1F1F6),

    ('🇮🇷', 'Iran flag', #$1F1F7),

    ('🇮🇸', 'Iceland flag', #$1F1F8),

    ('🇮🇹', 'Italy flag', #$1F1F9),

    ('🇯🇪', 'Jersey flag', #$1F1EA),

    ('🇯🇲', 'Jamaica flag', #$1F1F2),

    ('🇯🇴', 'Jordan flag', #$1F1F4),

    ('🇯🇵', 'Japan flag', #$1F1F5),

    ('🇰🇪', 'Kenya flag', #$1F1EA),

    ('🇰🇬', 'Kyrgyzstan flag', #$1F1EC),

    ('🇰🇭', 'Cambodia flag', #$1F1ED),

    ('🇰🇮', 'Kiribati flag', #$1F1EE),

    ('🇰🇲', 'Comoros Island flag', #$1F1F2),

    ('🇰🇳', 'St. Kitts &amp; Nevis Flag', #$1F1F3),

    ('🇰🇵', 'North Korea flag', #$1F1F5),

    ('🇰🇷', 'South Korea flag', #$1F1F7),

    ('🇰🇼', 'Kuwait flag', #$1F1FC),

    ('🇰🇾', 'Cayman Island flag', #$1F1FE),

    ('🇰🇿', 'Kazakhstan flag', #$1F1FF),

    ('🇱🇦', 'Laos flag', #$1F1E6),

    ('🇱🇧', 'Lebanon flag', #$1F1E7),

    ('🇱🇨', 'St. Lucia flag', #$1F1E8),

    ('🇱🇮', 'Liechtenstein flag', #$1F1EE),

    ('🇱🇰', 'Sri Lanka flag', #$1F1F0),

    ('🇱🇷', 'Liberia flag', #$1F1F7),

    ('🇱🇸', 'Lesotho flag', #$1F1F8),

    ('🇱🇹', 'LIthuania flag', #$1F1F9),

    ('🇱🇻', 'Latvia flag', #$1F1FB),

    ('🇱🇾', 'Libya flag', #$1F1FE),

    ('🇲🇦', 'Morocco flag', #$1F1E6),

    ('🇲🇨', 'Monaco flag', #$1F1E8),

    ('🇲🇩', 'Moldova flag', #$1F1E9),

    ('🇲🇪', 'Montenegro flag', #$1F1EA),

    ('🇲🇬', 'Montenegro flag', #$1F1EC),

    ('🇲🇭', 'Marshall Islands flag', #$1F1ED),

    ('🇲🇰', 'North Macedonia flag', #$1F1F0),

    ('🇲🇱', 'Mali flag', #$1F1F1),

    ('🇲🇲', 'Myanmar flag', #$1F1F2),

    ('🇲🇳', 'Mongolia flag', #$1F1F3),

    ('🇲🇴', 'Macao flag', #$1F1F4),

    ('🇲🇵', 'Northern Mariana Islands flag', #$1F1F5),

    ('🇲🇶', 'Marthinique flag', #$1F1F6),

    ('🇲🇷', 'Mauritania flag', #$1F1F7),

    ('🇲🇸', 'Montserrat flag', #$1F1F8),

    ('🇲🇹', 'Malta flag', #$1F1F9),

    ('🇲🇺', 'Mauritius flag', #$1F1FA),

    ('🇲🇻', 'Maldives flag', #$1F1FB),

    ('🇲🇼', 'Malawi flag', #$1F1FC),

    ('🇲🇽', 'Mexico flag', #$1F1FD),

    ('🇲🇾', 'Malaysia flag', #$1F1FE),

    ('🇲🇿', 'Mozambique flag', #$1F1FF),

    ('🇳🇦', 'Namibia flag', #$1F1E6),

    ('🇳🇨', 'New Caledonia flag', #$1F1E8),

    ('🇳🇪', 'Niger flag', #$1F1EA),

    ('🇳🇫', 'Norfolk Island flag', #$1F1EB),

    ('🇳🇬', 'Nigeria flag', #$1F1EC),

    ('🇳🇮', 'Nicaragua flag', #$1F1EE),

    ('🇳🇱', 'Netherlands flag', #$1F1F1),

    ('🇳🇴', 'Norway flag', #$1F1F4),

    ('🇳🇵', 'Nepal flag', #$1F1F5),

    ('🇳🇷', 'Nauru flag', #$1F1F7),

    ('🇳🇺', 'Niue flag', #$1F1FA),

    ('🇳🇿', 'New Zealand flag', #$1F1FF),

    ('🇴🇲', 'Oman flag', #$1F1F2),

    ('🇵🇦', 'Panama flag', #$1F1E6),

    ('🇵🇪', 'Peru flag', #$1F1EA),

    ('🇵🇫', 'French Polynesia flag', #$1F1EB),

    ('🇵🇬', 'Papua New Guinea flag', #$1F1EC),

    ('🇵🇭', 'Philipines flag', #$1F1ED),

    ('🇵🇰', 'Pakistan flag', #$1F1F0),

    ('🇵🇱', 'Poland flag', #$1F1F1),

    ('🇵🇲', 'St. Pierre &amp; Miquelon', #$1F1F2),

    ('🇵🇳', 'Pitcairn Islands flag', #$1F1F3),

    ('🇵🇷', 'Puerto Rico flag', #$1F1F7),

    ('🇵🇸', 'Palestinian Territories flag', #$1F1F8),

    ('🇵🇹', 'Portugal flag', #$1F1F9),

    ('🇵🇼', 'Palau flag', #$1F1FC),

    ('🇵🇾', 'Paraguay flag', #$1F1FE),

    ('🇶🇦', 'Qatar flag', #$1F1E6),

    ('🇷🇪', 'Réunion flag', #$1F1EA),

    ('🇷🇸', 'Serbia flag', #$1F1F8),

    ('🇷🇺', 'Russia flag', #$1F1FA),

    ('🇷🇼', 'Rwanda flag', #$1F1FC),

    ('🇸🇦', 'Saudi Arabia flag', #$1F1E6),

    ('🇸🇧', 'Solomon Islands', #$1F1E7),

    ('🇸🇨', 'Seychelles flag', #$1F1E8),

    ('🇸🇩', 'Sudan flag', #$1F1E9),

    ('🇸🇪', 'Sweeden flag', #$1F1EA),

    ('🇸🇬', 'Singapore flag', #$1F1EC),

    ('🇸🇭', 'St. Helena flag', #$1F1ED),

    ('🇸🇮', 'Slovenia flag', #$1F1EE),

    ('🇸🇯', 'Svalbard &amp; Jan Mayen', #$1F1EF),

    ('🇸🇰', 'Slovakia flag', #$1F1F0),

    ('🇸🇱', 'Sierra Leone flag', #$1F1F1),

    ('🇸🇲', 'San Marino flag', #$1F1F2),

    ('🇸🇳', 'Senegal flag', #$1F1F3),

    ('🇸🇴', 'Somalia flag', #$1F1F4),

    ('🇸🇷', 'Suriname flag', #$1F1F7),

    ('🇸🇸', 'South Sudan flag', #$1F1F8),

    ('🇸🇹', 'São Tomé &amp; Príncipe flag', #$1F1F9),

    ('🇸🇻', 'El Salvador flag', #$1F1FB),

    ('🇸🇽', 'Saint Maarten flag', #$1F1FD),

    ('🇸🇾', 'Syria flag', #$1F1FE),

    ('🇸🇿', 'Eswatini (Swaziland) flag', #$1F1FF),

    ('🇹🇦', 'Tristan da Cunha flag', #$1F1E6),

    ('🇹🇨', 'Turks &amp; Caicos Islands flag', #$1F1E8),

    ('🇹🇩', 'Chad flag', #$1F1E9),

    ('🇹🇫', 'French Southern Territories flag', #$1F1EB),

    ('🇹🇬', 'Togo flag', #$1F1EC),

    ('🇹🇭', 'Thailand flag', #$1F1ED),

    ('🇹🇯', 'Tajikistan flag', #$1F1EF),

    ('🇹🇰', 'Tokelau flag', #$1F1F0),

    ('🇹🇱', 'Timor-Leste flag', #$1F1F1),

    ('🇹🇲', 'Turkmenistan flag', #$1F1F2),

    ('🇹🇳', 'Tunisia flag', #$1F1F3),

    ('🇹🇴', 'Tonga flag', #$1F1F4),

    ('🇹🇷', 'Turkey flag', #$1F1F7),

    ('🇹🇹', 'Trinidad and Tobago flag', #$1F1F9),

    ('🇹🇻', 'Tuvalu flag', #$1F1FB),

    ('🇹🇼', 'Taiwan flag', #$1F1FC),

    ('🇹🇿', 'Tanzania flag', #$1F1FF),

    ('🇺🇦', 'Ukraine flag', #$1F1E6),

    ('🇺🇬', 'Uganda flag', #$1F1EC),

    ('🇺🇲', 'US Outlying Islands flag', #$1F1F2),

    ('🇺🇳', 'United Nations (UN) flag', #$1F1F3),

    ('🇺🇸', 'United State flag', #$1F1F8),

    ('🇺🇾', 'Uruguay flag', #$1F1FE),

    ('🇺🇿', 'Uzbekistan flag', #$1F1FF),

    ('🇻🇦', 'Vatical City flag', #$1F1E6),

    ('🇻🇨', 'St. Vincent &amp; Grenadines flag', #$1F1E8),

    ('🇻🇪', 'Venezuela flag', #$1F1EA),

    ('🇻🇬', 'British Virgin Islands flag', #$1F1EC),

    ('🇻🇮', 'U.S. Virgin Islands', #$1F1EE),

    ('🇻🇮', 'Vietnam flag', #$1F1F3),

    ('🇻🇺', 'Vanuatu flag', #$1F1FA),

    ('🇼🇫', 'Wallis &amp; Futuna flag', #$1F1EB),

    ('🇼🇸', 'Samoa flag', #$1F1F8),

    ('🇽🇰', 'Kosovo flag', #$1F1F0),

    ('🇾🇪', 'Yemen flag', #$1F1EA),

    ('🇾🇹', 'Mayotte flag', #$1F1F9),

    ('🇿🇦', 'South Africa flag', #$1F1E6),

    ('🇿🇲', 'Zambia flag', #$1F1F2),

    ('🇿🇼', 'Zimbabwe flag', #$1F1FC),

    // British Subdivision Flags

    ('🏴󠁧󠁢󠁥󠁮󠁧󠁿', 'England flag', #$E0067),

    ('🏴󠁧󠁢󠁳󠁣󠁴󠁿', 'Scotland flag', #$E0062),

    ('🏴󠁧󠁢󠁷󠁬󠁳󠁿', 'Wales flag', #$E0073));

implementation

{ TftEmojiButtonGroup }

procedure TftEmojiButtonGroup.ButtonClicked(Sender: TObject);
var
  Button: TSpeedButton;
  Str: String;
  I : Integer;
begin
  Button := Sender as TSpeedButton;
  if Assigned(Memo) then
  begin
    I := Memo.SelStart + 2;
    Str :=  Memo.Lines.Text.Insert(Memo.SelStart, Button.Text);
    Memo.Lines.Text := Str;
    Memo.SelStart := I;
  end;

end;

constructor TftEmojiButtonGroup.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Self.Parent := AOwner as TFmxObject;
  Self.Align := TAlignLayout.Top;
  // Self.ShowHint := True;
  // Self.BorderStyle := bsNone;
  // Self.ButtonHeight := 32;
  // Self.ButtonWidth := 32;
  // Self.Font.Size := 14;
  // Self.OnButtonClicked := ButtonClicked;
  UpdateEmojis;
end;

destructor TftEmojiButtonGroup.Destroy;
begin
  inherited;
end;

procedure TftEmojiButtonGroup.UpdateEmojis;
var
  I: Integer;
  CountCol: Integer;
  Button: TSpeedButton;
begin
  Self.Visible := False;

  CountCol := Round(Self.Width / 24);
  Self.ControlCollection.Clear;
  Self.ColumnCollection.Clear;
  Self.RowCollection.Clear;
  for I := 0 to CountCol - 2 do
  begin
    Self.ColumnCollection.Add;
    Self.ColumnCollection.Items[I].SizeStyle := TSizeStyle.Absolute;
    Self.ColumnCollection.Items[I].Value := 24;
  end;

  for I := 0 to 100 do
  begin
    Button := TSpeedButton.Create(Self);
    Button.Parent := Self;
    Button.Text := EMOJIS_CONSTANT[I][0];
    Button.Hint := EMOJIS_CONSTANT[I][1];
    Button.OnClick := Self.ButtonClicked;
    Self.ControlCollection.AddControl(Button, I, 0);
  end;
  Self.Visible := True;
end;

{ TftKeybordEmoji }

constructor TftKeybordEmoji.Create(AOwner: TComponent);
begin
  inherited;
  // Self.BorderStyle := bsNone;
  FEdSearch := TEdit.Create(AOwner);
  FEdSearch.Parent := Self;
  FEdSearch.Align := TAlignLayout.Top;
  FEdSearch.Height := 30;
  FEdSearch.Text := 'Search';
  FEdSearch.OnChange := EdSearchChange;

  FKeybord := TftEmojiButtonGroup.Create(AOwner);
  FKeybord.Parent := Self;
  FKeybord.Align := TAlignLayout.Top;
  FKeybord.Height := 200;
end;

destructor TftKeybordEmoji.Destroy;
begin
  FreeAndNil(FEdSearch);
  FreeAndNil(FKeybord);
  inherited;
end;

procedure TftKeybordEmoji.EdSearchChange(Sender: TObject);
var
  I: Integer;
  // Button: TGrpButtonItem;
begin
  Self.FKeybord.Visible := False;
  // Self.FKeybord.Items.Clear;
  // for I := 0 to 1047 do
  // begin
  // if (Pos(FEdSearch.Text, EMOJIS_CONSTANT[I][0]) <> 0) or (FEdSearch.Text = '')
  // then
  // begin
  // Button := Self.FKeybord.Items.Add;
  // Button.Caption := EMOJIS_CONSTANT[I][1];
  // Button.Hint := EMOJIS_CONSTANT[I][0];
  // end
  // else
  // Continue;
  // end;
  Self.FKeybord.Visible := True;
end;

function TftKeybordEmoji.GetMemo: TMemo;
begin
  Result := Self.FKeybord.FMemo;
end;

procedure TftKeybordEmoji.SetMemo(const Value: TMemo);
begin
  Self.FKeybord.FMemo := Value;
  FKeybord.UpdateEmojis;
end;

end.
