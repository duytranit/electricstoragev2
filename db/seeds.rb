# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Attachment.delete_all
Reply.delete_all
Feedback.delete_all
Invoicedetail.delete_all
Invoice.delete_all
Project.delete_all
Procategory.delete_all
User.delete_all

staff = User.create(
	email: 'nhanvien1@gmail.com',
	password: '123123123',
	first_name: 'Le Duy',
	last_name: 'Staff',
	role: 'staff',
	status: true
	)

User.create(
	email: 'khachhang1@gmail.com',
	password: '123123123',
	first_name: 'Le Duy',
	last_name: 'Customer',
	role: 'customer',
	status: true
	)

procategory = Procategory.create(
	name: '...',
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: nil,
	procategory_id: 0,
	ddc: "",
	level: 0
	)

congnghe = procategory.procategories.create(
	name: "Công nghệ",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "600",
	level: 1,
	description: "<p><em>Xem thêm 303.48 về công nghệ như là nguyên nhân của sự thay đổi văn hóa; cũng xem 306.4 về xã hội học của công nghệ; cũng xem 338.1-338.4 về khía cạnh kinh tế của công nghiệp dựa trên các công nghệ cụ thể; cũng xem 338.9 về công nghệ thích hợp; chuyển giao công nghệ.<em></p>

							<p><em>Xem Phần hướng dẫn ở 300 so với 600; cũng xem ở 363 so với 302-307, 333.7, 570-590, 600; vũng xem ở 363.1 so với 600; cũng xem ở 583-585 so với 600</em></p>
							<strong><p>TÓM LƯỢT</p>
							<p>601-609 : Tiểu phân mục chung và vẽ kỹ thuật, công nghệ vật liệu nguy hiểm</p>
							<p>610: Y học và sức khỏe</p>
							<p>620: Kỹ thuật và các hoạt dộng liên quan</p>
							<p>630: Nông nghiệp và các công nghệ liên quan</p>
							<p>640: Quản lý nhà cửa và gia đình</p>
							<p>650: Quản lý và các dịch vụ phụ trợ</p>
							<p>660: Kỹ thuật hóa học và các  công nghệ liên quan</p>
							<p>670: Công nghệ sản xuất</p>
							<p>680: Sản xuất sản phẩm chuyên dựng</p>
							<p>690: Nhà &amp; Xây dựng</p><strong>"	)

nongnghiep = congnghe.procategories.create(
	name: "Nông nghiệp và các công nghệ liên quan",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "630",
	level: congnghe.level + 1,
	description: "<p>Tiểu phân mục chung được thêm vào cho chung nông nghiệp và các công nghệ liên quan, cho riêng nông nghiệp.</p>
							<p>Xếp vào đây tác phẩm liên ngành về tầm quan trọng của nông nghiệp [trước đây cũng là 580]; trồng trọt, trang trại, cây trồng.</p>
							<p>Xếp xã hội học nông nghiệp vào 306.3; xếp kinh tế nông nghiệp vào 338.1</p>
							<em><p>Xem thêm 307.72 về xã hội học nông thôn; cũng xem 333.76 về kinh tế đất nông nghiệp; cũng xem 909 về tác phẩm tổng quát về điều kiện và văn minh nông thôn; cũng xem 930-990 về điều kiện và văn minh nông thôn các khu vực cụ thể.</p>
							<p>Xem phần hướng dẫn ở 571-575 so với 630; cũng xem ở 630 so với 579-590, 641.3</p><em/>
							<strong><p>TÓM LƯỢC</p>
							<p>630.1-.9: Tiểu phân mục chung</p>
							<p>631: Kỹ thuật cụ thể; máy móc, thiết bị, vật liệu</p>
							<p>632: Xâm hại, bệnh, sâu hại cây trồng</p>
							<p>633: Cây trồng ngoài đồng và trong đồn điền</p>
							<p>634: Vười cây ăn quả, quả, lâm nghiệp</p>
							<p>635: Cây trồng trong vườn (Nghề làm vườn) Rau</p>
							<p>636: Chăn nuôi</p>
							<p>637: Chế biến sữa và các sản phẩm liên quan</p>
							<p>638: Nuôi côn trùng</p>
							<p>639: Săn bắn, nghề cá, bảo tồn, các kỹ thuật liên quan</p></strong>"
	)

kythuat = nongnghiep.procategories.create(
	name: "Kỹ thuật cụ thể; máy móc, thiết bị, vật liệu",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "631",
	level: nongnghiep.level + 1,
	description: "<p>Đề tài chung cho trồng trọt và chăn nuôi hoặc giới hạn cho trồng trọt</p>
								<p>Xếp tác phẩm tổng hợp về máy móc, thiết bị, vật liệu sử dụng cho kỹ thuật hoặc quy trình phụ trợ cụ thể, vd., máy tính, vào 630.2</p>
								<p><em>Về thiệt hại, bênh, sau hại cây trồng, xem 632; về kỹ thuật, máy móc, thiết bị, vật liệu cho các cây trồng cụ thể, xem 633-635; về kỹ thuật, máy móc, thiết bị, vật liệu cụ thể cho các ngành chăn nuôi, xem 636</em></p>"
	)

caytrong = nongnghiep.procategories.create(
	name: "Cây trồng ngoài đồng và trong đồn điền",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "633",
	level: nongnghiep.level + 1,
	description: "<p>Cây trồng sản xuất trên quy mo lớn phục vụ cho nông nghiệp và công nghiệp chế biến không phải cho mục đích bảo tồn.</p>
								<p>Tiểu phân mục chung được thêm vào cho một hoặc cả hai đề tài có trong đề mục</p>
								<p>Xếp sản xuất rau tươi vào 635</p>
								<p><em>Về một cây trồng ngoài đồng hoặc cây trồng trong đồn điền cụ thể khoong được quy định ở đây xem cây trồng đó, vd., cây ăn quả trồng trong đồn điền 634.</em></p>
								<p>Kỹ thuật và quy trình phụ trợ; máy móc, thiết bị, vật liệu</p>
								<p>Không dùng cho kỹ thuật và quy trình phụ trợ; xếp vào 630.2. Không dùng cho máy móc, thiết bị, vật liệu, xếp vào 631</p>"
	)

vuoncay = nongnghiep.procategories.create(
	name: "Vườn cây ăn quả, quả, lâm nghiệp",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "634",
	level: nongnghiep.level + 1,
	description: "<p>Quả: phần sinh sản cua các cây có hạt co sphần thịt ngọt it hay nhiều cung với hạt, có thể ăn được</p>
								<p>Tiểu phân mục chung được thêm vào cho chung vườn cây ăn quả, quả, lâm nghiệp; cho riêng vườn cây ăn quả; cho riêng quả</p>
								<p>Bao gồm cả quả mọng, quả hạch, ôliu</p>
								<p>Xếp vào đây tác phẩm tổng hợp về cây thân gỗ</p>
								<p><em>Về cây trồng trong đồn điền, xem 635; về dưa, xem 635; về cây cảnh, xem 635.9</em></p>"
	)

caytrongvuon = nongnghiep.procategories.create(
	name: "Cây trồng trong vườn (Nghề làm vườn) Rau",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "635",
	level: nongnghiep.level + 1,
	description: "<p>Rau: cây trồng chủ yếu dành cho con người tiêu thụ không qua chế biến trung gian trừ nấu nướng và bảo quản</p>
								<p>Bao gồm cả cây thuốc, nấm; nhà kính và làm vườn hữu cơ</p>
								<p>Xếp vào đây nghề làm vườn trong nhà, sản xuất rau đem bán chợ xa</p>
								<p>Xếp vườn cây ăn quả vào 634</p>
								<p><em>Về sắn, khoai sọ, xem 633.6</em></p>"
	)

channuoi = nongnghiep.procategories.create(
	name: "Chăn nuôi",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "636",
	level: nongnghiep.level + 1,
	description: "<p>Bao gồm cả trang trại, chuồng trại, gia súc non</p>
								<p>Xếp vào đây tác phẩm liên ngành về các loài gia súc</p>
								<p>Xếp trại chăn nuôi và chuồng trại dành cho các loại vật nuôi cụ thể, cho gia súc non của các loại vật nuôi cụ thể vào 636.1-636.9</p>
								<p><em>Về nuôi các loại động vật chưa thuần hóa, xem 639. Về một khia cạnh phi nông nghiệp cụ thể của các loại vật nuôi có vú, xem kía canh đó, vd., sinh học vật nuôi có vú 599</em></p>
								<p><em>Xem Phần hướng dẫn ở 800 so với 398.24, 590, 636</em></p>
								<strong><p>TÓM LƯỢC</p>
								<p>.1 Họ Ngựa: Ngựa</p>
								<p>.2 Động vật nhai lại và họ lạc đà: Bò, Gia súc lớn có sừng</p>
								<p>.3 Động vật nhai lại nhỏ: Cừu</p>
								<p>.4 Lợn</p>
								<p>.5 Gia cầm: Gà</p>
								<p>.6 Chim không phải gia cầm</p>
								<p>.7 Chó</p>
								<p>.8 Mèo</p>
								<p>.9 Động vật có vú khác</p></strong>"
	)

sua = nongnghiep.procategories.create(
	name: "Chế biến sữa và các sản phẩm liên quan",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "637",
	level: nongnghiep.level + 1,
	description: "<p>Bao gồm cả sữa, bơ, phó mát, chế biến trứng; sản xuất đồ tráng miệng ướp lạnh, vd., kem</p>
								<p>Xếp chăn nuôi gia cầm lấy trứng vào 636.5; xếp tác phẩm tổng hợp về chăn nuôi lấy sữa vào 636.2</p>"
	)

contrung = nongnghiep.procategories.create(
	name: "Nuôi côn trùng",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "638",
	level: nongnghiep.level + 1,
	description: "<p>Bao gồm cả nuôi ong (nghề nuôi ong), chế biến mật ong, làm vườn nuôi bướm; nuôi tầm</p>"
	)

ngheca = nongnghiep.procategories.create(
	name: "Săn bắn, nghề cá, bảo tồn, các kỹ thuật liên quan",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "639",
	level: nongnghiep.level + 1,
	description: "<p>Bao gồm cả nuôi và đanh bắt động vật không xương sống, vd., động vật có vỏ cứng (tôm, cua), động vật thân mềm</p>
								<p>Xếp tác phẩm tổng hợp về săn bắn thương mại và thể thao vào 799.2</p>
								<p><em>Về nuôi côn trùng, xem 638; về săn bắn và câu cá thể thao, xem 799</em></p>
								<p><em>Xem thêm 636.97 về chăn nuôi lấy lông</em></p>"
	)

danhbat = ngheca.procategories.create(
	name: "Đánh bắt cá, săn cá voi, săn hải cẩu thương mại",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "639.2",
	level: ngheca.level + 1,
	description: "<p>Tiểu phân mục chung được thêm vào cho chung đánh bắt cá, săn cá voi, săn hải cẩu thương mại, cho riêng đánh bắt cá thương mại</p>
								<p>Xếp vào đay tác phẩm về nghề cá bao hàm cả nuôi lẫn đanh bắt, về nghề cá bao hàm cả động vật không xương sống lẫn cá có xương sống</p>
								<p>Xếp nghề nuôi các động vật không xương sống vào 639; xếp tác phẩm tổng hợp về nuôi thủy sản vào 639.8</p>
								<p><em>Về nuôi cá, xem 639.3</em></p>"
	)

nuoi = ngheca.procategories.create(
	name: "Nuôi các động vật có xương sống máu lạnh: Nuôi cá",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "639.3",
	level: ngheca.level + 1,
	description: "<p>Bao gồm cả nuôi động vật lưỡng cư, vd., nuôi ếch; trại ương cá; nuôi động vật bò sát</p>
								<p>Xếp  vào đây động vật có xương sống máu lạnh làm vật yêu quý</p>"
	)

nuoitrongbe = nuoi.procategories.create(
	name: "Nuôi ca trong bể",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "639.34",
	level: nuoi.level + 1,
	description: "<p>Bao gồm cả bể cá biển</p>
								<p>Xếp vào đay bể ca nước ngọt, bể cá trong nhà</p>
								<p>Xếp tác phẩm liên ngành về bể cá vào 597.073</p>"
	)

nuoithuysan = ngheca.procategories.create(
	name: "Nuôi trồng thủy sản",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "639.8",
	level: ngheca.level + 1,
	description: "<p>Bao gồm cả trồng thực vật dưới nước</p>
								<p>Xếp vào đay nuôi hải sản</p>
								<p>Xếp thủy canh vào 631.5. Xếp nuôi một loai thủy sản cụ thể theo loài đó, vd., nuôi cá 639.3</p>"
	)

baoton = ngheca.procategories.create(
	name: "Bảo tồn tài nguyên sinh học",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "639.9",
	level: ngheca.level + 1,
	description: "<p>Bao gồm cả chồng dịch bệnh, sau hại, thú dữ; cải thiện môi trường sống, khu bảo tồn và nơi ẩn náu; bảo tồn thực vật</p>
								<p>Xếp vào đây việc bảo tồn các loài động vật, thú rừng, động vật có vú, động vật có xương sống, động vật hoang dã; bảo vệ thú rừng</p>
								<p>Xếp tác phẩm tổng hợp về chống sâu bệnh trong nông nghiệp vào 632; xếp tác phẩm tổng hợp về chống thú dữ trong nông nghiệp vào 636.08; xếp tác phẩm liên ngành về bảo tồn tài nguyên sinh hoc vào 333.95</p>
								<p><em>Xem thêm 636.088 về nuôi thú rừng máu nóng</em></p>
								<p><em>Xem Phần hướng dẫn ở 333.95 so với 639.9</em></p>"
	)

baotoncovu = baoton.procategories.create(
	name: "Các loài động vật có vú cụ thể",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "639.97",
	level: baoton.level + 1,
	description: "<p>Xếp tác phẩm tổng hợp về bảo tồn các loài động vật có vú cụ thể vào 639.9</p>"
	)

ngua = channuoi.procategories.create(
	name: "Họ Ngựa: Ngựa",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "636.1",
	level: channuoi.level + 1,
	description: "<p>Bao gồm cả lừa, la, ngựa nhỏ, ngựa vằn</p>
								<p>Xếp đào tạo người cưỡi ngựa và đánh xe, tác phẩm tổng hợp về huấn luyện ngựa và người cuỗi ngựa và đánh xe vào 798</p>"
	)

bo = channuoi.procategories.create(
	name: "Động vật nhai lại và họ lạc đà: Bò, Gia súc lớn có sừng",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "636.2",
	level: channuoi.level + 1,
	description: "<p>Bao gồm cả bò Bison, hươu, Ilamas; sản xuất sữa, chăn nuôi gia súc lớn lấy thịt</p>
								<p>Xếp vắt sữa và chế biến sữa vào 637</p>
								<p><em>Về động vật nhai lại nhỏ, xem 636.3</em></p>"
	)

cuu = channuoi.procategories.create(
	name: "Động vật nhai lại nhỏ: Cừu",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "636.3",
	level: channuoi.level + 1,
	description: "<p>Bao gồm cả dê</p>
								<p>Xếp hươu chuột vào 636.963</p>"
	)

lon = channuoi.procategories.create(
	name: "Lợn",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "636.4",
	level: channuoi.level + 1
	)

ga = channuoi.procategories.create(
	name: "Gia cầm: Gà",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "636.5",
	level: channuoi.level + 1,
	description: "<p>Bao gồm cả vịt, ngỗng, chim công, gà lôi, gà tây</p>
								<p>Xếp vào đây tác phẩm tổng hợp về nuôi chim, tác phẩm liên ngành về gia cầm</p>
								<p><em>Về chim khôn gphải gia cầm, xem 636.6. Về khía cạnh phi nông nghiệp cụ thể của gia cầm, xem khia cạnh đó, vd., sinh hoc gia cầm 598</em></p>"
	)

chim = channuoi.procategories.create(
	name: "Chim không phải gia cầm",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "636.6",
	level: channuoi.level + 1,
	description: "<p>Bao gồm cả chim săn,. chim cảnh; chim biết hót</p>
								<p>Xếp tác phẩm tổng hợp về chim vào 636.5</p>
								<p><em>Về chim công, xem 636.5</em></p>"
	)

cho = channuoi.procategories.create(
	name: "Chó",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "636.7",
	level: channuoi.level + 1
	)

meo = channuoi.procategories.create(
	name: "Mèo",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "636.8",
	level: channuoi.level + 1,
	description: "<p>Bao gồm cả các loại không phải mèo nhà, vd., mèo gấm Mỹ</p>"
	)

covu = channuoi.procategories.create(
	name: "Động vật có vú khác",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "636.9",
	level: channuoi.level + 1,
	description: "<p>Thêm vào chỉ số cơ bản 636.9 các số tiếp sau 599 trong 599.2-599.8, vd., loài găm nhắm 636.935, động vật co da lông 636.97; tuy nhiên, về ngựa, xem 636.1; về họ lạc đà, động vật nhai ljai không phải hươu chuột, xem 636.2; về họ mèo, xem 636.8</p>"
	)

caycanh = caytrongvuon.procategories.create(
	name: "Hoa và cây cảnh",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "635.9",
	level: caytrongvuon.level + 1,
	description: "<p>Tiểu phân mục chung được thêm vào cho một hoặc cả hai đề tài có trong đề mục</p>
								<p>Bao gồm cả bonsai, cây hàng rào, cây trồng trong nhà, bãi cỏ, cây bóng mát</p>
								<p>Xếp vào đây nghề trồng hoa</p>
								<p>Xếp cây được sử dụng làm hàng rào vào 631.2; xếp kiến trúc vường hoa cảnh vào 712; xếp săp xếp hoa vào 745.92</p>
								<p><em>Về trồng và chăm sóc cây ven đường, xem 625.7</em></p>
								<p><em>Xem phần hướng dẫn ở 635.9 so với 625.7</em></p>
								<p>Kỹ thuật và quy trình phụ trợ không dùng cho máy móc, thiết bị, vật liệu; xếp vào 635.9</p>"
	)

nho = vuoncay.procategories.create(
	name: "Nho",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "634.8",
	level: vuoncay.level + 1,
	description: "<p>Xếp vào đây nghề trồng nho</p>"
	)

lamnghiep = vuoncay.procategories.create(
	name: "Lâm nghiệp",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "634.9",
	level: vuoncay.level + 1,
	description: "<p>Bao gồm cả nông lâm nghiệp; kỹ thuật chống cháy rừng; lâm học, vd., trồng rừng, phục hồi rừng; lâm sản, vd., bột gỗ; đốn gỗ, tác phẩm tổng hợp về xẻ gỗ</p>
								<p>Xếp cây không có gỗ trồng làm bột giấy vào 633.8; xếp gỗ xẻ vào 674; xếp tác phẩm liên ngành về trồng rừng và trồng lại rừng vào 333.75. Xếp các cây trồng cho sản phẩm không phải gỗ xẻ hoặc bột gỗ theo sản phẩm đó, vd., cây cao su 633.8, cây hồ đào 634</p>
								<p><em>Về vận hành nhà máy cưa, xem 674</em></p>
								<p>Quản lý sản xuất không dùng cho quản lý sản xuất, xếp vào 634.9</p>"
	)

ngucoc = caytrong.procategories.create(
	name: "Ngũ cốc",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "633.1",
	level: caytrong.level + 1,
	description: "<p>Bao gồm cả lúa mjach, kiều mạch, ngô, yến mạch, lúa, lúa mạch đen, lúa mì</p>
								<p>Về cây ngũ cốc làm thức ăn gia súc, xem 633.2; về ngô vườn (pop corn), xem 635</p>"
	)

thucan = caytrong.procategories.create(
	name: "Cây thức ăn gia súc",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "633.2",
	level: caytrong.level + 1,
	description: "<p>Bao gồm cả bãi chăn thả và cỏ, cỏ hòa thảo</p>
								<p>Xếp vào đây cỏ làm thức ăn gia súc</p>
								<p>Xếp sử dụng rừng làm nơi chăn thả vào 634.9; xếp tác phẩm tổng hợp về trại chăn nuôi và nông trại dành cho vật nuôi vào 636</p>
								<p><em>Về cây làm thức ăn gia súc không phải là cỏ, xem 633.3</em></p>"
	)

hodau = caytrong.procategories.create(
	name: "Cây họ đậu, cây thức ăn gia súc không phải cỏ và cây họ đậu",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "633.3",
	level: caytrong.level + 1,
	description: "<p>Tiểu phân mục chung được thêm vào cho chung cây họ đầu và cây thức ăn gia súc không phải cây họ đậu, cho riêng cây họ đậu</p>
								<p>Bao gồm cỏ linh lăng, đạu tương, cỏ ba lá, cây lac, đậu</p>
								<p>Xếp vào đây cây họ đạu làm thức ăn gia súc, cây họ đạu lấy hạt</p>
								<p>Xếp tác phẩm liên ngành về cây họ đạu làm thực phẩm vào 641.3</p>
								<p><em>Về các loại quả thuộc cây họ đậu, xem 634; về cây họ đạu trồng ở vườn, xem 635</em></p>"
	)

laysoi = caytrong.procategories.create(
	name: "Cây lấy sợi",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "633.5",
	level: caytrong.level + 1,
	description: "<p>Bao gồm cả bông, lanh, đay; cây mây tre</p>
								<p>Xếp vào đây cây sợi mềm</p>
								<p>Xếp cây láy sợi trồng làm bột giấy vào 633.8</p>"
	)

layduong = caytrong.procategories.create(
	name: "Cây lấy đường, cây có nước đường, cây lấy bột",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "633.6",
	level: caytrong.level + 1,
	description: "<p>Tiểu phân mục chung được thêm vào cho chung cây lấy đường, cây có nước đường, cây lấy bột; cho riêng cây lấy đường; cho riêng cây có nước đường</p>
								<p>Bao gồm cả củ cải đường, cây gỗ thích có đường, mia, cây lúa miến ngọt; sắn, khoai sọ</p>
								<p>Xếp cây trồng lấy bột và sản phẩm khác theo sản phẩm khác đó, vd., khoai tây 635</p>"
	)

ancaloit = caytrong.procategories.create(
	name: "Cây có ancaloit",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "633.7",
	level: caytrong.level + 1,
	description: "<p>Bao gồm cả cacao, cà phê, chè, thuốc lá</p>"
	)

caycongnghiep = caytrong.procategories.create(
	name: "Các loại cây trồng khác dùng cho chế biến công nghiệp",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "633.8",
	level: caytrong.level + 1,
	description: "<p>Bao gồm cả cây có dầu; cây gia vị; cây làm thuôc nhuộm, hương liệu, cây thuốc, nước hoa, cao su</p>
								<p><em>Về cây dừa, cây ôliu, xem 634; về hành và cây gia vị khác, rau thom và ngọt, xem 635. Về cây trồng sản sinh ra thuốc như là một sản phẩm phụ, xem sản phẩm chính, vd., cây thuốc phiện 633.7</em></p>"
	)


xaydung = kythuat.procategories.create(
	name: "Công trình xây dựng trong nông nghiệp",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "631.2",
	level: kythuat.level + 1,
	description: "<p>Bao gồm cả kho chứa, đập, hàng rào; đường đi, cầu cống</p>
								<p>Xếp xây dựng cầu vào 624.2; xếp xây dựng đường trong trang trại vào 625.7; xếp xây dựng đập vào 627; xếp xây dựng nhà và các kết cấu khác trong trang trại vào 690</p>
								<p><em>Về làm chuồng cho gia súc, xem 636.08</em></p>"
	)

dungcu = kythuat.procategories.create(
	name: "Dụng cụ, cơ khí, máy móc, thiết bị",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "631.3",
	level: kythuat.level + 1,
	description: "<p>Bao gồm nhà xưởng</p>
								<p>Xếp chế tạo dụng cụ, cơ khí, máy móc, thiết bị vào 681. Xếp chế tạo một loại máy cụ thể theo loại đó, vd., chế tạo máy kéo 629.225</p>
								<p><em>Về thiết bị cho một mục đích cụ thể, xem mục đích đó, vd., nhà kính 631.5</em></p>
								<p><em>Xem thêm 631.2 về công trình xây dựng trong nông nghiệp</em></p>"
	)

khoahocdat = kythuat.procategories.create(
	name: "Khoa học đất",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "631.4",
	level: kythuat.level + 1,
	description: "<p>Bao gồm cả xói mòn, lập bản đồ thổ nhưỡng, tác phẩm nông nghiệp tổng hợp về bảo tồn đất và nước</p>
								<p>Xếp vào đây tác phẩm liên ngành về đất</p>
								<p>Xếp sử dụng phân bón và các chất cải tạo đất vào 631.8; xếp tác phẩm kỹ thuật tổng hợp về xói mòn đất vào 627; xếp  tác phẩm liên ngành về bảo tồn đất vào 333.73; xếp tác phẩm liên ngành về xói mòn đất vào 551.3; xếp tác phẩm liên ngành về cơ học đất vào 624.1</p>
								<p><em>Về phục hồi đất, xem 631.6; về bảo tồn nước, xem 631.7. Về một khía cạnh cụ thể của đất, xem khía cạnh đó, vd., thành tạo thổ nhưỡng 551.3, sử dụng đất trong xây dựng 624.1</em></p>"
	)

trongtrot = kythuat.procategories.create(
	name: "Trồng trọt và thu hoạch",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "631.5",
	level: kythuat.level + 1,
	description: "<p>Bao gồm cả di truyền học nông nghiệp, vườn ươm, nhân giống cây trồng, hạt giống và danh muc hạt giống, các giống cây trồng, năng suất; các công đoạn sau thu hoạch, vd., phân loại, bảo quản trong kho; các phương pháp trồng trọt đặc biệt, vd., luân canh, trồng trọt khô, nông nghiệp nhà kính, tưới tiêu, trồng trọt hữu cơ, nông nghiệp không cần đất (thủy canh)</p>
								<p>Chỉ sử dụng chỉ số này cho tưới tiêu khi tác phẩm mô tả liên quan tới công việc trong trang trại, vd., lắp đặt và sử dụng hệ thống tưới phun</p>
								<p>Xếp các phương pháp trồng trọt đặc biệt như là đề tài trong kinh tế đất đai vào 333.76; xếp các phương pháp trồng trọt đặc biệt như là đề tài trong kinh tế nông nghiệp vào 338.1; xếp sinh họcc cây nông nghiệp vào 580; xếp đào giếng vào 628.1; xếp tác phẩm liên ngành về tưới tiêu vào 333.91; xếp tác phẩm liên ngành về khía cạnh kỹ thuật của tưới tiêu, các công rình nhận nước tưới từ nguồi ngoài trang trại vào 627</p>
								<p><em>Về thoát nước thải, xem 628.3; về trồng trọt dể bảo tồn đất, luân canh cây trồng chống xói mòn, xem 631.4; về nhà kính, làm vườn hữu cơ, xem 635. Về từng khía cạnh của trồng trọt hữu cơ, xem khía cạnh đó, vd., phân vi sinh 631.8</em></p>
								<p><em>Xem phần hướng dẫn ở 338.1 so với 631.5</em></p>"
	)

dondat = kythuat.procategories.create(
	name: "Dọn đất, tiêu nước, phục hồi đất",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "631.6",
	level: kythuat.level + 1,
	description: "<p>Bao gồm cả cải tạo bề mặt đất mỏ</p>
								<p>Xếp vào đây cải tạo đất</p>
								<p>Xếp phục hồi rừng vào 634.9; xếp các dự án tiêu nước ngoài trang trại, tác phẩm liên ngành về các khía cạnh kỹ thuật của tiêu nước và cải tạo đất vào 627</p>"
	)

baotonnuoc = kythuat.procategories.create(
	name: "Bảo tồn nước",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "631.7",
	level: kythuat.level + 1,
	description: "<p><em>Về trồng trọt để bảo tồn nước, xem 631.5</em></p>"
	)

phanbon = kythuat.procategories.create(
	name: "Phân bón, chất cải tạo đất, chất điều hòa sinh trưởng",
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "631.8",
	level: kythuat.level + 1,
	description: "<p>Tiểu phân mục chung được thêm vào cho chung phân bón, chất dưỡng đất, chất điều hòa sinh trưởng, cho riêng phân bón</p>
								<p>Xếp vào đây tác phẩm liên ngành về hóa chất nông nghiệp</p>
								<p>Xếp tác phẩm tổng hợp về độ phì đất vào 631.4</p>
								<p><em>Về thuốc trừ sâu, xem 632; về sản xuất hóa chất nông nghiệp, xem 668</em></p>"
	)

cn = procategory.procategories.create(
	name: 'Chăn Nuôi',
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "300",
	level: 1,
	description: "Bao gồm cả mức đọ tìm được, mức độ chính xác, mức độ tìm phù hợp. Xếp vào đây tìm kiếm và tìm lại trong hệ thống lưu trữ và tìm tin; hế thống trung gian (front-end); Internet (mạng toàn cầu) được xem như là một hệ thống lưu trữ và tìm tin; thư mục các website; thư viện số; tác phẩm tổng hợp về mục lục trực tuyến được tích hợp vào hệ thống lưu trử và tìm tin, về lưu trữ, tìm kiếm, tìm lại thông tin tự động; tác phẩm liên ngành về cơ sở dữ liệu."
	)

cn.procategories.create(
	name: 'Chăn Nuôi 01',
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "310",
	level: cn.level + 1,
	description: "Bao gồm cả mức đọ tìm được, mức độ chính xác, mức độ tìm phù hợp. Xếp vào đây tìm kiếm và tìm lại trong hệ thống lưu trữ và tìm tin; hế thống trung gian (front-end); Internet (mạng toàn cầu) được xem như là một hệ thống lưu trữ và tìm tin; thư mục các website; thư viện số; tác phẩm tổng hợp về mục lục trực tuyến được tích hợp vào hệ thống lưu trử và tìm tin, về lưu trữ, tìm kiếm, tìm lại thông tin tự động; tác phẩm liên ngành về cơ sở dữ liệu."
	)

cn.procategories.create(
	name: 'Chăn Nuôi 02',
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "320",
	level: cn.level + 1,
	description: "Bao gồm cả mức đọ tìm được, mức độ chính xác, mức độ tìm phù hợp. Xếp vào đây tìm kiếm và tìm lại trong hệ thống lưu trữ và tìm tin; hế thống trung gian (front-end); Internet (mạng toàn cầu) được xem như là một hệ thống lưu trữ và tìm tin; thư mục các website; thư viện số; tác phẩm tổng hợp về mục lục trực tuyến được tích hợp vào hệ thống lưu trử và tìm tin, về lưu trữ, tìm kiếm, tìm lại thông tin tự động; tác phẩm liên ngành về cơ sở dữ liệu."
	)

tt = procategory.procategories.create(
	name: 'Trồng Trọt',
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "400",
	level: 1,
	description: "Bao gồm cả mức đọ tìm được, mức độ chính xác, mức độ tìm phù hợp. Xếp vào đây tìm kiếm và tìm lại trong hệ thống lưu trữ và tìm tin; hế thống trung gian (front-end); Internet (mạng toàn cầu) được xem như là một hệ thống lưu trữ và tìm tin; thư mục các website; thư viện số; tác phẩm tổng hợp về mục lục trực tuyến được tích hợp vào hệ thống lưu trử và tìm tin, về lưu trữ, tìm kiếm, tìm lại thông tin tự động; tác phẩm liên ngành về cơ sở dữ liệu."
	)

tt.procategories.create(
	name: 'Trồng Trọt 01',
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "410",
	level: tt.level + 1,
	description: "Bao gồm cả mức đọ tìm được, mức độ chính xác, mức độ tìm phù hợp. Xếp vào đây tìm kiếm và tìm lại trong hệ thống lưu trữ và tìm tin; hế thống trung gian (front-end); Internet (mạng toàn cầu) được xem như là một hệ thống lưu trữ và tìm tin; thư mục các website; thư viện số; tác phẩm tổng hợp về mục lục trực tuyến được tích hợp vào hệ thống lưu trử và tìm tin, về lưu trữ, tìm kiếm, tìm lại thông tin tự động; tác phẩm liên ngành về cơ sở dữ liệu."
	)

tt.procategories.create(
	name: 'Trồng Trọt 02',
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "420",
	level: tt.level + 1,
	description: "Bao gồm cả mức đọ tìm được, mức độ chính xác, mức độ tìm phù hợp. Xếp vào đây tìm kiếm và tìm lại trong hệ thống lưu trữ và tìm tin; hế thống trung gian (front-end); Internet (mạng toàn cầu) được xem như là một hệ thống lưu trữ và tìm tin; thư mục các website; thư viện số; tác phẩm tổng hợp về mục lục trực tuyến được tích hợp vào hệ thống lưu trử và tìm tin, về lưu trữ, tìm kiếm, tìm lại thông tin tự động; tác phẩm liên ngành về cơ sở dữ liệu."
	)

da = procategory.procategories.create(
	name: 'Dự Án',
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "500",
	level: 1,
	description: "Bao gồm cả mức đọ tìm được, mức độ chính xác, mức độ tìm phù hợp. Xếp vào đây tìm kiếm và tìm lại trong hệ thống lưu trữ và tìm tin; hế thống trung gian (front-end); Internet (mạng toàn cầu) được xem như là một hệ thống lưu trữ và tìm tin; thư mục các website; thư viện số; tác phẩm tổng hợp về mục lục trực tuyến được tích hợp vào hệ thống lưu trử và tìm tin, về lưu trữ, tìm kiếm, tìm lại thông tin tự động; tác phẩm liên ngành về cơ sở dữ liệu."
	)

da.procategories.create(
	name: 'Dự Án 01',
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "510",
	level: da.level + 1,
	description: "Bao gồm cả mức đọ tìm được, mức độ chính xác, mức độ tìm phù hợp. Xếp vào đây tìm kiếm và tìm lại trong hệ thống lưu trữ và tìm tin; hế thống trung gian (front-end); Internet (mạng toàn cầu) được xem như là một hệ thống lưu trữ và tìm tin; thư mục các website; thư viện số; tác phẩm tổng hợp về mục lục trực tuyến được tích hợp vào hệ thống lưu trử và tìm tin, về lưu trữ, tìm kiếm, tìm lại thông tin tự động; tác phẩm liên ngành về cơ sở dữ liệu."
	)

da.procategories.create(
	name: 'Dự Án 02',
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id,
	ddc: "520",
	level: da.level + 1,
	description: "Bao gồm cả mức đọ tìm được, mức độ chính xác, mức độ tìm phù hợp. Xếp vào đây tìm kiếm và tìm lại trong hệ thống lưu trữ và tìm tin; hế thống trung gian (front-end); Internet (mạng toàn cầu) được xem như là một hệ thống lưu trữ và tìm tin; thư mục các website; thư viện số; tác phẩm tổng hợp về mục lục trực tuyến được tích hợp vào hệ thống lưu trử và tìm tin, về lưu trữ, tìm kiếm, tìm lại thông tin tự động; tác phẩm liên ngành về cơ sở dữ liệu."
	)

cn.projects.create(
	title: "Hiệu quả từ mô hình đệm lót sinh học trong chăn nuôi heo",
	share: true,
	status: true,
	description: "Năm 2013, từ nguồn kinh phí sự nghiệp của Trung tâm Khuyến nông An Giang, Trạm Khuyến nông Thị xã Tân Châu đã triển khai thực hiện trình diễn mô hình “Sử dụng chế phẩm sinh học BALASA-N01 làm đệm lót lên men trong chăn nuôi heo thịt” tại chuồng nuôi của anh Lý Minh Luận, ngụ ấp Phú Hưng, xã Phú Vĩnh, TX. Tân Châu.",
	price: 0,
	user_id: staff.id,
	created_at: DateTime.now,
	updated_at: DateTime.now
	)

cn.projects.create(
	title: "Nhiều bất cập khi nuôi tôm thẻ chân trắng trong vùng nước ngọt",
	share: true,
	status: true,
	description: "Cuối năm 2013 và những tháng đầu năm 2014, giá tôm thẻ chân trắng (TCT) liên tục nằm ở mức cao, người dân có lợi nhuận hấp dẫn nên đã thu hút một số nông dân thả nuôi tôm TCT trong vùng nước ngọt. Tuy nhiên, đây chỉ là hành động có lợi trước mắt nhưng hậu quả rất to lớn và lâu dài nên các địa phương cần quan tâm quản lý nuôi tôm TCT trong vùng nước ngọt.",
	price: 0,
	user_id: staff.id,
	created_at: DateTime.now,
	updated_at: DateTime.now
	)

cn.projects.create(
	title: "Hiệu quả vùng nuôi tôm biển an toàn, sạch bệnh",
	share: true,
	status: true,
	description: "Trong vụ nuôi tôm biển năm 2014, tại xã An Đức, huyện Ba Tri, Sở Nông nghiệp và Phát triển nông thôn tỉnh Bến Tre, Công ty cổ phần chăn nuôi CP Việt Nam cùng với doanh nghiệp tư nhân Tuấn Khanh cùng phối hợp thực hiện liên kết xây dựng vùng nuôi tôm biển an toàn dịch bệnh. Vùng nuôi tôm biển an toàn dịch bệnh tại huyện Ba Tri có quy mô 100 hecta, trong đó có 65 hecta mặt nước với gần 150 hộ tham gia.",
	price: 0,
	user_id: staff.id,
	created_at: DateTime.now,
	updated_at: DateTime.now
	)

cn.projects.create(
	title: "Giải pháp chế biến phụ phẩm nông nghiệp làm thức ăn cho bò",
	share: true,
	status: true,
	description: "Được hỗ trợ từ Kế hoạch “Xây dựng mô hình ứng dụng giải pháp phù hợp trong chế biến phụ phẩm nông nghiệp làm thức ăn cho bò thịt tại huyện Chợ Mới” của Chi cục Thú y, chị Nguyễn Thị Thanh Hiền, ngụ ấp Bình Trung, xã Bình Phước Xuân đã đầu tư sử dụng máy thái thân cây thức ăn, kết hợp quy trình trộn thức ăn tinh vào 3 tháng cuối trước khi xuất chuồng cho đàn bò.",
	price: 0,
	user_id: staff.id,
	created_at: DateTime.now,
	updated_at: DateTime.now
	)

cn.projects.create(
	title: "Nuôi cá bông lau trong ao",
	share: true,
	status: true,
	description: "Anh Nguyễn Tâm Đăng ở xã Phú Tân, huyện Tân Phú Đông (Tiền Giang) là người đầu tiên thành công nuôi dưỡng cá bông lau từ nguồn giống tự nhiên với quy mô lớn nhất ĐBSCL. Đây là loài cá có giá trị cao gấp 4-5 lần cá tra.",
	price: 0,
	user_id: staff.id,
	created_at: DateTime.now,
	updated_at: DateTime.now
	)

tt.projects.create(
	title: "Cách làm hiệu quả của Tổ hợp tác bưởi da xanh Phú Thành (Quới Sơn, Châu Thành)",
	share: true,
	status: true,
	description: "Tổ hợp tác (THT) sản xuất bưởi da xanh Phú Thành thuộc xã Quới Sơn, huyện Châu Thành, là một trong những tổ hợp tác đầu tiên trong huyện được cấp chứng nhận VietGAP với 18 hộ, diện tích 8,5 ha. Tiếp xúc với các thành viên trong tổ mới thấy hết được sự quyết tâm và niềm đam mê của họ với bưởi da xanh thế nào.",
	price: 0,
	user_id: staff.id,
	created_at: DateTime.now,
	updated_at: DateTime.now
	)

tt.projects.create(
	title: "Ứng dụng tiến bộ khoa học trong bảo quản, chế biến nông sản, thực phẩm -Cứu cánh của ngành nông nghiệp",
	share: true,
	status: true,
	description: "Khoa học và công nghệ ngày càng chứng tỏ tầm quan trọng đối với nền kinh tế cũng như đối với từng gia đình. Nông dân, ngư dân, những người vốn không quen với các phương tiện hiện đại cũng ngày càng cảm nhận rõ sức ép của việc thiếu kiến thức khoa học, công nghệ và việc chưa tiếp cận được các quy trình chế biến, bảo quản tiên tiến dẫn đến chất lượng, giá trị nông sản thấp và họ thường xuyên phải lo lắng về đầu ra cho các sản phẩm của mình mỗi khi đến mùa thu hoạch.",
	price: 0,
	user_id: staff.id,
	created_at: DateTime.now,
	updated_at: DateTime.now
	)

tt.projects.create(
	title: "Tiền Giang: Nông dân áp dụng kỹ thuật trồng sơ ri mới",
	share: true,
	status: true,
	description: "Hiện nay, nhiều nông dân trồng sơ ri ở huyện Gò Công Đông (Tiền Giang) đã bắt đầu thực hiện quy trình canh tác sơ ri của Nhật Bản theo hướng dẫn của Công ty TNHH MTV Nichirei Suco VN để đáp ứng yêu cầu chất lượng trái sơ ri thu mua phục vụ chế biến của doanh nghiệp này.",
	price: 0,
	user_id: staff.id,
	created_at: DateTime.now,
	updated_at: DateTime.now
	)

tt.projects.create(
	title: "Làm thế nào để liên kết trong sản xuất, chế biến, tiêu thụ dừa trái hiệu quả nhất?",
	share: true,
	status: true,
	description: "Đó là vấn đề được nhiều đại biểu đặt ra tại hội thảo Mô hình liên kết sản xuất, chế biến, tiêu thụ dừa ngày 20/6, do Ban điều phối thực hiện Chương trình phát triển ngành dừa phối hợp với Hiệp hội Dừa, Ban quản lý Dự án DBRP, Liên hiệp các hội khoa học kỹ thuật tổ chức, với sự tham dự của đại diện lãnh đạo một số sở ngành tỉnh, các huyện, thành phố, hội nông dân, chi hội trồng dừa các vùng dự án, điểm thu mua chế biến dừa, các công ty chuyên sản xuất, kinh doanh, chế biến dừa.",
	price: 0,
	user_id: staff.id,
	created_at: DateTime.now,
	updated_at: DateTime.now
	)

tt.projects.create(
	title: "Giới thiệu công nghệ bảo quản rau quả, trái cây tươi bằng chế phẩm sinh học từ Chitosan, không độc hại",
	share: true,
	status: true,
	description: "Từ nguyên liệu chitosan đã chế tạo ra chế phẩm sinh học để tạo màng trên trái cây, rau quả. Đã có công nghệ bảo quản trái cây tươi từ khâu thu hái đến khi bán sản phẩm ra ngoài thị trường.",
	price: 0,
	user_id: staff.id,
	created_at: DateTime.now,
	updated_at: DateTime.now
	)

tt.projects.create(
	title: "Hiệu quả bước đầu từ việc triển khai Chương trình phát triển ngành dừa Bến Tre",
	share: true,
	status: true,
	description: "Sau khi Chương trình phát triển ngành dừa được tỉnh phê duyệt, Sở Công thương đã phối hợp triển khai với các sở ngành, địa phương và doanh nghiệp tiêu biểu trong sản xuất kinh doanh ngành dừa. Ngoài tập trung triển khai 30 nội dung trong khung kế hoạch, các sở ngành cũng đã xây dựng kế hoạch triển khai thực hiện chương trình bước đầu rất khả quan.
Hiện tổng diện tích dừa toàn tỉnh là 63.439 ha, tăng 5,82% so mục tiêu; năng suất đạt 9.220 trái/ha; sản lượng 6 tháng đầu năm đạt 240,85 triệu trái, tăng 6,1% so cùng kỳ. Giá trị sản xuất công nghiệp các sản phẩm 6 tháng qua đạt 540 tỷ đồng, tăng 13,68% so cùng kỳ. Trong đó, các sản phẩm chế biến dừa chủ yếu đều tăng: Cơm dừa nạo sấy sản xuất được 17.000 tấn, tăng 3,53%; sữa dừa 16.350 tấn, tăng 12,67%; chỉ xơ dừa 42.550 tấn, tăng 14,57%; than thiêu kết 17.430 tấn, tăng 35,32%; than hoạt tính 4.700 tấn, tăng 38%. Kim ngạch xuất khẩu các sản phẩm dừa đạt 86 triệu USD, tăng 38%. Các sản phẩm dừa khác xuất khẩu có sự tăng trưởng khá hơn như cơm dừa nạo sấy tăng 50%, chỉ xơ dừa tăng 39%, than hoạt tính tăng 28%. ",
	price: 0,
	user_id: staff.id,
	created_at: DateTime.now,
	updated_at: DateTime.now
	)

da.projects.create(
	title: "Nghiệm thu dự án khoa học: “Nâng cao chất lượng điểm du lịch tỉnh Bến Tre”",
	share: true,
	status: true,
	description: "Dự án được thực hiện với mục tiêu hỗ trợ, tạo mô hình nâng cao chất lượng tổ chức, hoạt động dịch vụ du lịch, chất lượng phục vụ du khách, giải quyết vệ sinh môi trường điểm chọn nhằm phát triển nhanh ngành du lịch của tỉnh. Nội dung thực hiện dự án gồm điều tra, khảo sát thực tế cảnh quang, môi trường, bộ máy tổ chức, nhân sự, trình độ văn hóa, chuyên môn nghiệp vụ….của 20 điểm du lịch trong tỉnh. Trong đó, chọn 2 điểm du lịch sinh thái Lan Vương (thành phố Bến Tre), Cồn Phụng (huyện Châu Thành) và 02 khu di tích lịch sử Đền thờ Nguyễn Đình Chiểu (huyện Ba Tri) và khu di tích lịch sử Đồng Khởi (huyện Mỏ Cày Nam) để đầu tư làm mô hình điểm. Ngoài ra, dự án còn đầu tư cơ sở vật chất, xây dựng kế hoạch quảng bá du lịch qua các kênh thông tin, xây dựng và triển khai chương trình đào tạo nâng cao nguồn nhân lực phục vụ du lịch. ",
	price: 0,
	user_id: staff.id,
	created_at: DateTime.now,
	updated_at: DateTime.now
	)

da.projects.create(
	title: "Giới thiệu công nghệ CAS và khả năng ứng dụng trong bảo quản nông sản, thủy sản”",
	share: true,
	status: true,
	description: "CAS (Cells Alive System) hay “Hệ thống tế bào còn sống”, là công nghệ lạnh đông nhanh với chức năng CAS được sử dụng để bảo quản nông sản, thủy sản và thực phẩm đạt độ tươi “Fresh CAS - tươi như CAS”; nghĩa là các sản phẩm được bảo quản bằng công nghệ CAS từ 1 đến nhiều năm, sau khi rã đông sản phẩm vẫn đạt độ tươi nguyên như ban đầu, giữ được cấu trúc mô tế bào, màu sắc, hương vị và chất lượng sản phẩm.",
	price: 0,
	user_id: staff.id,
	created_at: DateTime.now,
	updated_at: DateTime.now
	)

da.projects.create(
	title: "Hội thảo triển khai phổ biến thích ứng biến đổi khí hậu vùng ĐBSCL tại tỉnh Bến Tre”",
	share: true,
	status: true,
	description: "Ngày 02/7/2014, Ban điều phối Dự án Thích ứng với biến đổi khí hậu vùng đồng bằng sông Cửu Long (AMD) tỉnh Bến Tre phối hợp với UBND huyện Bình Đại tổ chức hội thảo triển khai dự án. Đến dự có ông Lê Minh Hòa - Phó giám đốc Ban điều phối dự án tỉnh; bà Nguyễn Duy Hải Minh - Trưởng nhóm dự án AMD tỉnh, ông Võ Văn Quân - Phó chủ tịch UBND huyện Bình Đại.",
	price: 0,
	user_id: staff.id,
	created_at: DateTime.now,
	updated_at: DateTime.now
	)

da.projects.create(
	title: "Nghiệm thu dự án Trạm Thông tin cộng đồng",
	share: true,
	status: true,
	description: "Hội đồng KH&CN chuyên ngành tỉnh Bến Tre tổ chức nghiệm thu dự án: “Xây dựng Trạm thông tin khoa học công nghệ phục vụ cộng đồng, góp phần xây dựng nông thôn mới trên địa bàn tỉnh Bến Tre trong bối cảnh xâm nhập mặn và Biến đổi khí hậu”. Dự án thuộc chương trình Khoa học công nghệ cấp Bộ.",
	price: 0,
	user_id: staff.id,
	created_at: DateTime.now,
	updated_at: DateTime.now
	)