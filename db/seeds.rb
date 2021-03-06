# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PlaceField.create(place_m: "指定無し(全国)")
PlaceField.create(place_m: "北海道")
PlaceField.create(place_m: "東北")
PlaceField.create(place_m: "北陸・甲信越")
PlaceField.create(place_m: "関東")
PlaceField.create(place_m: "東海")
PlaceField.create(place_m: "関西")
PlaceField.create(place_m: "中国")
PlaceField.create(place_m: "四国")
PlaceField.create(place_m: "九州")
PlaceField.create(place_m: "沖縄")

Purpose.create(purpose_date: "販路拡大")
Purpose.create(purpose_date: "仕入先拡充/共同仕入")
Purpose.create(purpose_date: "技術協力")
Purpose.create(purpose_date: "生産協力")
Purpose.create(purpose_date: "土地の売買")
Purpose.create(purpose_date: "設備の売買")
Purpose.create(purpose_date: "その他")

Settlement.create(settlement_account: "非公開")
Settlement.create(settlement_account: "長期的な黒字経営")
Settlement.create(settlement_account: "直近の3年間黒字経営")
Settlement.create(settlement_account: "直近決算にて黒字経営")
Settlement.create(settlement_account: "一過性の赤字経営")
Settlement.create(settlement_account: "直近の3年間赤字経営")
Settlement.create(settlement_account: "長期的な赤字経営")

Type.create(type_industry: "建設・設備")
Type.create(type_industry: "住宅・インテリア・内装")
Type.create(type_industry: "食品・飲料")
Type.create(type_industry: "製造・加工業")
Type.create(type_industry: "卸売・小売・飲食")
Type.create(type_industry: "サービス")
Type.create(type_industry: "金融・保険")
Type.create(type_industry: "不動産")
Type.create(type_industry: "アパレル・服装")
Type.create(type_industry: "運輸・通信")
Type.create(type_industry: "印刷・事務機器・日用品")
Type.create(type_industry: "精密・医療機器")
Type.create(type_industry: "電子・電気・OA機器")
Type.create(type_industry: "農林・水産")
Type.create(type_industry: "林業・漁業")
Type.create(type_industry: "電子・ガス")
Type.create(type_industry: "その他")
