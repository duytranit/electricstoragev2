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
	email: 'staff1@gmail.com',
	password: '123123123',
	first_name: 'Le Duy',
	last_name: 'Staff',
	role: 'staff',
	status: true
	)

User.create(
	email: 'customer1@gmail.com',
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
	procategory_id: 0
	)

cn = procategory.procategories.create(
	name: 'Chăn Nuôi',
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id
	)

tt = procategory.procategories.create(
	name: 'Trồng Trọt',
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id
	)
da = procategory.procategories.create(
	name: 'Dự Án',
	status: true,
	created_at: DateTime.now,
	updated_at: DateTime.now,
	user_id: staff.id
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