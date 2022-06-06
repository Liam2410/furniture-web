SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Cơ sở dữ liệu: `furnituredatabase`
--
CREATE DATABASE IF NOT EXISTS `furnituredatabase` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `furnituredatabase`;

-- --------------------------------------------------------

CREATE TABLE `Account`(
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `email` VARCHAR(256) NOT NULL UNIQUE,
	`password` VARCHAR(24) NOT NULL,
    `phone` VARCHAR(10) NOT NULL UNIQUE,
    `fullname` VARCHAR(128) NOT NULL,
    `role` VARCHAR(10) NOT NULL,
    `gender` VARCHAR(10) NOT NULL,
    `birthday` DATE NOT NULL,
    `address` VARCHAR(512) DEFAULT NULL,
    `avatar` VARCHAR(512) NOT NULL DEFAULT 'avatar-default.png',
    `joinDate` DATETIME DEFAULT NOW()
);
INSERT INTO `Account` (`email`, `password`, `phone`, `fullname`, `role`, `gender`, `birthday`, `address`) VALUES
('daohien@gmail.com', '123456789', '0395616763', 'Hiền', 'Admin', 'Female', '2000-01-30', 'Hà nội'),
('nhat@gmail.com', '123456789', '0347982088', 'Nhật', 'Customer', 'Male', '2000-01-30', 'Hà nội'),
('thang@gmail.com', '123456789', '0379028110', 'Thắng', 'Customer', 'Male', '2000-01-30', 'Hà nội');


CREATE TABLE `Product` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(256) NOT NULL UNIQUE,
    `price` INT NOT NULL,
    `quantity` INT NOT NULL,
    `type` VARCHAR(512) NOT NULL,
    `description` TEXT NOT NULL,
    `productImage` VARCHAR(256) NOT NULL,
    `addDate` DATETIME NOT NULL DEFAULT NOW()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
INSERT INTO `Product` (`name`, `price`, `quantity`, `type`, `description`, `productImage`) VALUES
('Bàn Ghế Gỗ Kiểu Mới Gỗ Tràm Mặt Gõ Chạm Đào Tay Rồng Bộ 6 Món Tay 12', 16500000, 5, 'Bàn ghế gỗ', 
'<p>Đối với người Việt, gia đình luôn là nơi để trở về, nơi mang đến niềm vui và hy vọng cho mọi người giữa những vất vả của cuộc sống. Còn gì hạnh phúc hơn khi các thành viên được quây quần cạnh nhau trong một không gian ấm cúng, kể nhau nghe những điều thú vị và cùng vui vẻ tận hưởng những phút giây giải trí. Mẫu bàn ghế gỗ salon được thiết kế theo phong cách châu Á cổ điển sẽ đem lại một không gian phòng khách tuyệt vời để bạn và người thân cũng nhau truyện trò và chia sẻ những điều khó khăn trong cuộc sống của mình. Tìm hiểu về sản phẩm độc đáo này ngay sau đây nhé. </p>',
'salon-go-tram-mat-go-do-cham-thu-phap-phuc-loc-tho-bo-tay-10-6-mon-gia-re.jpg'),
('Bộ Bàn Ghế Salon Nhỏ Gỗ Gõ Đỏ Chạm Đào Tay 8 6 Món Đẹp Giá Rẻ', 25500000, 10, 'Bàn ghế gỗ', 
'<p>Với tiêu chí chất lượng được đặt lên hàng đầu bộ salon gỗ này được chọn lựa từ những tấm gỗ có chất lượng tốt nhất, điêu khắc dụng tâm dưới bàn tay tài hoa, điêu luyện của những người thợ lành nghề. Họ đã góp phần tạo nên những đường nét hoa văn chạm trổ tinh xảo, những họa tiết hài hòa mang đến vẻ đẹp ấn tượng và đầy cuốn hút cho bộ sản phẩm.
			<br/>
			<br/>
Họa tiết chủ đạo là cành đào sum suê với những quả đào tiên được chạm nổi giúp sản phẩm nổi bật hơn rất nhiều so với những bộ bàn ghế chạm hoa văn chìm khác. Phần đỉnh ghế được mài nhẵn mịn làm nơi tựa đầu, tạo cảm giác thoải mái cho người sử dụng. 
			<br/>
			<br/>
Vai ghế tạo nên một đường cong rủ về phía dưới liền với họa tiết chạm Nghê chân thực, sống động đến từng chiếc vảy trên lưng đẹp, chân thực và sống động như thật.
			<br/>
			<br/>
Phần lưng ghế chạm khắc đẹp với 5 biểu tượng Tùng - Mai - Cúc - Trúc - Sen vừa tao nhã lại không kém phần quý phái, tất cả đều được hoàn thiện với độ chính xác cao, hoàn hảo để tạo nên sự đồng bộ tốt nhất cho tổng thể sản phẩm.
			<br/>
			<br/>
Các chi tiết phụ như chân bàn, chân ghế, đôn đều được chạm thêm một số họa tiết nhỏ dạng hoa văn cách điệu đẹp, đối xứng và đồng đều với nhau ở nhiều góc cạnh. Tạo nên tính tương đồng và cân bằng tuyệt đối cho sản phẩm dù dưới bất kỳ góc nhìn nào.
			<br/>
			<br/>
Và cũng không thể bỏ quên chất liệu gỗ gõ đỏ với gam màu vàng ngà chuyển đỏ nhạt với các đường vân gỗ tự nhiên đặc trưng độc đáo, đẹp mắt. Đặc biệt các chi tiết mặt trước và các chi tiết chạm trổ nhiều như đỉnh ghế, lưng ghế được chọn lựa những tấm có vân đẹp nhất để tạo nên vẻ đẹp ấn tượng và cuốn hút nhất với người xem. 
		</p>',
'bo-ban-ghe-salon-nho-go-go-do-cham-dao-tay-8-6-mon-dep-gia-re-3.jpg'),
('Bàn Ghế Phòng Khách Gỗ Hương Vân Chạm Đào Tay 10 6 Món Đẹp Giá Rẻ', 33500000, 20, 'Bàn ghế gỗ', 
'<p>Độ dày bộ salon gỗ đảm bảo chất lượng với mặt bàn, mặt ghế dày 1.5cm, khung đối và lưng tựa là 2.5cm, tay ghế đường kính 10cm, chân bàn, ghế cạnh 12cm cùng phần tó cao 30cm dày 10cm. Từ bàn, băng dài, ghế đơn, ghế đôn, bàn trà... đều có kết cấu bền bỉ được ghép mộng nối tỉ mỉ, đảm bảo chất lượng và độ bền lâu dài theo thời gian.  
			<br/>
			<br/>
Đỉnh ghế đơn & bằng dài được chạm hoa tiết đào tiên gồm 4 cặp biểu tượng cho sự sung túc, vượng khí, sinh khí và bình an. Lưng ghế chạm tứ quý tượng trưng cho 4 mùa, tượng trưng cho sự hài hòa của đất trời, trọn vẹn của thiên địa, thời tiết thuận hòa, cuộc sống ấm no hạnh phúc. Họa tiết chữ chữ Thọ cách điệu khung tròn mang ý nghĩa về sự viên mãn và cuộc sống trường thọ. Mặt trước và 2 mặt bên ghế được chạm hoa văn hình bông hoa cách điệu rất đẹp, đảm bảo giá trị thẩm mỹ hài hòa tốt nhất cho sản phẩm.
			<br/>
			<br/>
Bàn trà & 2 ghế đôn được thiết kế theo kiểu pano gồm 2 mặt mặt trơn phẳng rộng rãi, được chọn lựa từ tấm gỗ lớn nguyên khối phô bày toàn bộ vẻ đẹp của chất gỗ tự nhiên với những vân gỗ uốn lượn độc đáo. Kiểu dáng chân quỳ bệ vệ được làm hơi cong nhẹ, mặt chạm họa tiết huyền vũ chìm sâu vào mặt gỗ, kết hợp với những hoa văn nhỏ chạm đối xứng, hài hòa và cân bằng với nhau.
			<br/>
			<br/>
Ngoài phần mặt trên đã được làm nhẵn và đánh bóng thì mặt sau đều đã được mài láng và loại bỏ hoàn toàn dăm gỗ thừa trong quá trình chế tác. Đảm bảo trọn bộ đều láng mịn và phẳng, đáp ứng tốt nhất yêu cầu về chất lượng cho người sở hữu.
		</p>',
'ban-ghe-phong-khach-go-huong-van-cham-dao-tay-10-6-mon-dep-gia-re.jpg'),
('Salon Mun Đuôi Công Chạm Đào Tay 10 6 Món Đẹp Giá Rẻ', 38500000, 5, 'Bàn ghế gỗ', 
'<p>Đối với người Việt, gia đình luôn là nơi để trở về, nơi mang đến niềm vui và hy vọng cho mọi người giữa những vất vả của cuộc sống. Còn gì hạnh phúc hơn khi các thành viên được quây quần cạnh nhau trong một không gian ấm cúng, kể nhau nghe những điều thú vị và cùng vui vẻ tận hưởng những phút giây giải trí. Mẫu bàn ghế gỗ salon được thiết kế theo phong cách châu Á cổ điển sẽ đem lại một không gian phòng khách tuyệt vời để bạn và người thân cũng nhau truyện trò và chia sẻ những điều khó khăn trong cuộc sống của mình. Tìm hiểu về sản phẩm độc đáo này ngay sau đây nhé. </p>',
'salon-mun-duoi-cong-cham-dao-tay-10-6-mon-dep-gia-re.jpg'),
('Bàn Uống Trà Thúng Gỗ Cẩm Lai Cao Cấp Giá Ưu Đãi', 27000000, 72, 'Bàn ghế gỗ', 
'<p>Đối với người Việt, gia đình luôn là nơi để trở về, nơi mang đến niềm vui và hy vọng cho mọi người giữa những vất vả của cuộc sống. Còn gì hạnh phúc hơn khi các thành viên được quây quần cạnh nhau trong một không gian ấm cúng, kể nhau nghe những điều thú vị và cùng vui vẻ tận hưởng những phút giây giải trí. Mẫu bàn ghế gỗ salon được thiết kế theo phong cách châu Á cổ điển sẽ đem lại một không gian phòng khách tuyệt vời để bạn và người thân cũng nhau truyện trò và chia sẻ những điều khó khăn trong cuộc sống của mình. Tìm hiểu về sản phẩm độc đáo này ngay sau đây nhé. </p>',
'ban-uong-tra-thung-go-cam-lai-cao-cap-gia-uu-dai.jpg'),

('Bàn Ghế Gỗ Gõ Đỏ Phòng Khách Chạm Nho 6 Món', 22500000, 27, 'Bàn ghế gỗ', 
'<p>Bộ salon gỗ chạm nho cổ điển SL721 được thiết kế với kiểu dáng thon gọn, họa văn chạm trổ đơn giản hướng tới những không gian phòng khách nhỏ. Sở hữu những vân gỗ ưa nhìn với màu gỗ đặc trưng mang hơi hướng mộc mạc thuần tự nhiên, đáp ứng tốt yêu cầu về tính thẩm mỹ & giá trị sử dụng thực tiễn trong đời sống của khách hàng.
			<br/>
Băng ghế dài & 2 ghế đơn được làm với chiều sâu lên tới 50cm, đảm bảo không gian rộng rãi thoải mái cho người ngồi. Lưng ghế thiết kế dạng cánh hoa mai với 5 cánh nở rộ ôm lấy phần khung tranh. Mặt khung tranh được chạm họa tiết hoa nở tứ quý tượng trưng cho sức sống, sự may mắn, bình an trong cuộc sống. Hoa văn trang trí được chạm sâu vào bề mặt không gây khó chịu cho người ngồi khi tựa lưng.
			<br/>
Mặt bàn trà làm theo kiểu pano cổ điển với mặt vân gỗ đẹp & đều nhau. Với bàn trà khách hàng được hỗ trợ chi phí cắt kính cường lực để tăng khả năng chống trầy xước bề mặt gỗ, giúp việc sử dụng tiện lợi hơn.
			<br/>
 2 ghế đôn nhỏ với kích thước tiêu chuẩn 45 x 45 x 37cm đảm bảo tính nhỏ gọn, dễ sắp xếp thay đổi theo từng gia đình.
			<br/>
Toàn bộ sản phẩm đều được làm từ chất liệu gỗ gõ đỏ tự nhiên với ưu điểm tốt về độ bền, khả năng chịu lực hiệu quả, tính thân thiện & an toàn với sức khỏe người sử dụng. Với tuổi thọ tốt lên tới >50 năm đảm bảo giá trị thiết thực nhất trong cuộc sống của khách hàng.
		</p>',
'ban-ghe-go-go-do-phong-khach-cham-nho-6-mon.jpg'),

('Salon Gỗ Gõ Đỏ Khung Tranh Cho Phòng Khách Nhỏ Đẹp Giá Rẻ', 31500000, 29, 'Bàn ghế gỗ', 
'<p>Tổng thể bộ bàn ghế phòng khách được thiết kế khá đơn giản với những tấm gỗ được tạo hình khối vuông xếp đối xứng và cân bằng với nhau. Những tấm gỗ từ tay ghế, vai ghế, chân ghế, chân bàn đều chung một kích cỡ tiêu chuẩn để đảm bảo sự đồng điệu & tính thẩm mỹ cho thiết kế. Với kiểu dáng đơn giản, kích thước nhỏ gọn rất thích hợp với phòng khách hẹp và những khách hàng yêu thích nội thất theo phong cách tối giản.
			<br/>
Khung tranh lớn lưng ghế được chạm hoa nở tứ quý với ý nghĩa của sự sung túc, bình an và may mắn, khung tranh nhỏ chạm hoa văn cuộn đơn giản tăng tính đối xứng cho họa tiết sản phẩm. Tất cả hoa văn đều được hoàn thiện tỉ mỉ với độ chính xác cao đảm bảo khách hàng sẽ cảm nhận từng cánh hoa nở, từng chiếc lá rơi đều được chạm nổi tạo nên sự chân thực và sống động nhất.
			<br/>
Toàn bộ mặt trước và mặt sau bộ salon gỗ giá rẻ này đều được mãi nhẵn, sơn bóng mờ để giữ nguyên được màu sắc và vân gỗ đặc trưng của chất gỗ gõ tự nhiên. Để đảm bảo mặt bàn được sử dụng tốt hơn, chống trầy xước hiệu quả chúng tôi hỗ trợ cắt thêm kính cho khách hàng với mức giá ưu đãi nhất. Bạn có thể tùy chọn kính thường hay kính cường lực mài lá hẹ theo sở thích và điều kiện tài chính của bản thân mình. 
			<br/>
Ngoài ưu điểm về thiết kế và kiểu dáng độc đáo, chất gỗ gõ đỏ làm sản phẩm cũng được đánh giá cao với tuổi thọ tốt, độ bền lâu dài lên tới 50 năm. Gỗ có 2 màu là màu vàng gõ đặc trưng khi mới chế tác và màu gõ đỏ đậm lên màu theo thời gian, là trải nghiệm thú vị với khách hàng khi quyết định chọn lựa nội thất làm từ loại gỗ đặc biệt này.
		</p>',
'salon-go-go-do-khung-tranh-cho-phong-khach-nho-dep-gia-re.jpg'),
('Bàn Ghế Salon Phòng Khách Gỗ Sồi Tay Cuộn 10 6 Món Đẹp Giá Rẻ', 20500000, 30, 'Bàn ghế gỗ', 
'<p>Đối với người Việt, gia đình luôn là nơi để trở về, nơi mang đến niềm vui và hy vọng cho mọi người giữa những vất vả của cuộc sống. Còn gì hạnh phúc hơn khi các thành viên được quây quần cạnh nhau trong một không gian ấm cúng, kể nhau nghe những điều thú vị và cùng vui vẻ tận hưởng những phút giây giải trí. Mẫu bàn ghế gỗ salon được thiết kế theo phong cách châu Á cổ điển sẽ đem lại một không gian phòng khách tuyệt vời để bạn và người thân cũng nhau truyện trò và chia sẻ những điều khó khăn trong cuộc sống của mình. Tìm hiểu về sản phẩm độc đáo này ngay sau đây nhé. </p>',
'ban-ghe-salon-phong-khach-go-soi-tay-cuon-10-6-mon-dep-gia-re-1.jpg'),
('Kệ Tủ Tivi Gỗ Hương Đá Hiện Đại Đẹp Giá Rẻ', 5300000, 10, 'Kệ Ti Vi', 
'<p>Ngoài bộ bàn ghế, kệ tivi là một trong những sản phẩm đóng vai trò trung tâm, được ví như linh hồn của phòng khách. Đây là nơi cả nhà quây quần cùng xem các chương trình giải trí trên TV và gắn kết thêm tình cảm gia đình. Mẫu kệ tivi này được thiết kế nhỏ gọn với các đường nét đơn giản đem lại vẻ đẹp nhẹ nhàng, thanh thoát sẽ làm bừng sáng không gian phòng khách của gia đình bạn. 
			<br/>
			<br/>
Kệ tivi được hoàn thiện từ chất liệu gỗ hương đá tự nhiên với những khối gỗ hương mộc được đẽo gọt, đục chạm và liên kết với nhau để tạo nên một sản phẩm hoàn thiện với sự kỹ lưỡng trên từng chi tiết mang đến khả năng chịu lực tuyệt vời. Chất gỗ hương đá rắn chắc, chống lại cong vênh, ẩm mốc, mối mọt hiệu quả đồng thời tuổi thọ sản phẩm lâu dài mang lại giá trị sử dụng tối ưu nhất. 
			<br/>
			<br/>
Một trong những ưu điểm khiến nhiều khách hàng say mê gỗ hương đá chính là màu sắc và vân gỗ. Các đường vân nâu đậm uốn lượn nhiều kiểu dáng khác lạ trên nền gỗ với tông màu nâu đỏ tự nhiên tạo nên vẻ đẹp độc đáo và lạ mắt như vân đá quý lôi cuốn sự chú ý của khách hàng. 
			<br/>
			<br/>
Để làm nổi bật nét đẹp tự nhiên của kệ tivi đồng thời đáp ứng nhu cầu thẩm mỹ của khách hàng, sản phẩm được thiết kế với phong cách hiện đại đơn giản tinh tế và trang nhã. Thay vì sử dụng các hoa văn cầu kỳ rườm rà rối mắt, kệ tivi được tạo hình bởi các thanh gỗ tạo nên các ô, các khối chữ nhật đối xứng. Các góc cạnh được tính toán tỉ mỉ làm nổi bật vẻ đẹp tràn đầy lịch lãm, mạnh mẽ của sản phẩm nhưng không tạo nên sự khô cứng trong thiết kế. 
			<br/>
			<br/>
Tính tiện nghi cao, đa công dụng là một vật phẩm trang trí tạo nên điểm nhấn nổi bật cho không gian phòng khách. Hai kệ tủ ở hai bên có thể được sử dụng vào nhiều mục đích như nơi bảo quản tài liệu, sách báo, hoặc điều khiển… Các khoảng trống ở trung tâm kệ tivi tạo thành một kệ trưng bày nơi bạn có thể để những cuốn sách yêu quý của mình lên.  
			<br/>
Sản phẩm bao gồm 5 kích thước cơ bản sử dụng được cho hầu hết các không gian phòng khách hiện nay. Các kích thước được thực hiện theo số đo chuẩn phong thủy mang lại may mắn cho gia chủ và các thành viên trong gia đình. 
		</p>',
'ke-tu-tivi-go-huong-da-hien-dai-dep-gia-re.jpg'),
('Kệ Tủ Để Tivi Gỗ Gõ Đỏ Hiện Đại Bền Đẹp Giá Rẻ', 5700000, 10, 'Kệ Ti Vi', 
'<p>Kệ để tivi KV721E được đánh giá là một trong những mẫu kệ có kiểu dáng hiện đại đẹp, trẻ trung, màu sắc bắt mắt, chất lượng tốt nhất trên thị trường hiện nay. Sở hữu thiết kế đơn giản, kết cấu vuông vức, kích thước tiêu chuẩn (sâu 40cm, cao 63cm) giúp tiết kiệm diện tích không gian hiệu quả. Ngoài ra với 2 hộc kéo âm chuyên dụng giúp khách hàng có thêm nhiều lựa chọn sử dụng, sắp xếp đồ dùng thuận tiện hơn.
			<br/>
			<br/>
Tủ tivi gỗ KV721E hoàn thiện dạng 2 tầng, được ghép nối giữa các khối gỗ vuông vắn tạo nên vẻ ngoài góc cạnh, mạnh mẽ. Tuy nhiên, các cạnh gỗ lại được bo cong nhẹ, mang lại hiệu quả cân bằng và giúp tổng thể sản phẩm uyển chuyển, mềm mại hơn, bớt đi những đường nét khô cứng kém thẩm mỹ.
			<br/>
			<br/>
Kết cấu sản phẩm được làm liền mạch với nhau, giữa 2 tầng được gắn thêm tấm gỗ lớn dày ~5cm, có tác dụng nâng khả năng chịu lực cho tầng 2 được tốt hơn. Mặt sàn tầng 1 được làm mặt dày hơn, thêm 2 hộc tủ để vừa tăng diện tích sử dụng, vừa đảm bảo tính chịu lực cho thiết kế. 4 chân tủ lớn, bề mặt chân rộng tăng diện tích tiếp xúc với mặt sàn, cố định kệ chắc chắn, ổn định hơn.
			<br/>
			<br/>
Sở hữu vẻ đẹp tự nhiên với gam màu vàng gõ tự nhiên, xen lẫn các vân gỗ nâu đậm đem đến nét gần gũi, mộc mạc, với độ rắc chắc tốt, chống chịu được các yếu tố không tốt từ môi trường cùng tuổi thọ lâu dài sẽ là lựa chọn tuyệt vời để đem lại sự an tâm trong quá trình sử dụng. Dễ dàng phối hợp bày trí với những món nội thất phòng khách khác như salon gỗ, sofa gỗ, tủ rượu… để tạo nên một không gian đẹp, đồng điệu về phong cách thiết kế cho khách hàng.
		</p>',
'ke-tu-de-tivi-go-go-do-hien-dai-ben-dep-gia-re.jpg'),
('Kệ Tivi Gỗ Hương Xám Hiện Đại Đẹp Giá Rẻ', 4800000, 10, 'Kệ Ti Vi', 
'<p>Kệ để tivi KV721E được đánh giá là một trong những mẫu kệ có kiểu dáng hiện đại đẹp, trẻ trung, màu sắc bắt mắt, chất lượng tốt nhất trên thị trường hiện nay. Sở hữu thiết kế đơn giản, kết cấu vuông vức, kích thước tiêu chuẩn (sâu 40cm, cao 63cm) giúp tiết kiệm diện tích không gian hiệu quả. Ngoài ra với 2 hộc kéo âm chuyên dụng giúp khách hàng có thêm nhiều lựa chọn sử dụng, sắp xếp đồ dùng thuận tiện hơn.
			<br/>
			<br/>
Tủ tivi gỗ KV721E hoàn thiện dạng 2 tầng, được ghép nối giữa các khối gỗ vuông vắn tạo nên vẻ ngoài góc cạnh, mạnh mẽ. Tuy nhiên, các cạnh gỗ lại được bo cong nhẹ, mang lại hiệu quả cân bằng và giúp tổng thể sản phẩm uyển chuyển, mềm mại hơn, bớt đi những đường nét khô cứng kém thẩm mỹ.
			<br/>
			<br/>
Kết cấu sản phẩm được làm liền mạch với nhau, giữa 2 tầng được gắn thêm tấm gỗ lớn dày ~5cm, có tác dụng nâng khả năng chịu lực cho tầng 2 được tốt hơn. Mặt sàn tầng 1 được làm mặt dày hơn, thêm 2 hộc tủ để vừa tăng diện tích sử dụng, vừa đảm bảo tính chịu lực cho thiết kế. 4 chân tủ lớn, bề mặt chân rộng tăng diện tích tiếp xúc với mặt sàn, cố định kệ chắc chắn, ổn định hơn.
			<br/>
			<br/>
Sở hữu vẻ đẹp tự nhiên với gam màu vàng gõ tự nhiên, xen lẫn các vân gỗ nâu đậm đem đến nét gần gũi, mộc mạc, với độ rắc chắc tốt, chống chịu được các yếu tố không tốt từ môi trường cùng tuổi thọ lâu dài sẽ là lựa chọn tuyệt vời để đem lại sự an tâm trong quá trình sử dụng. Dễ dàng phối hợp bày trí với những món nội thất phòng khách khác như salon gỗ, sofa gỗ, tủ rượu… để tạo nên một không gian đẹp, đồng điệu về phong cách thiết kế cho khách hàng.
		</p>',
'ke-tivi-go-huong-xam-hien-dai-dep-gia-re.jpg'),

('Kệ Tivi Vát Gỗ Gõ Đỏ Tự Nhiên Đẹp Giá Rẻ', 10500000, 17, 'Kệ Ti Vi', 
'<p>Sản phẩm được hoàn thiện từ chất liệu gỗ gõ đỏ - loại gỗ quý được sử dụng phổ biến trong gia công đồ nội thất, với tông màu vàng đỏ tươi sáng, bắt mắt. Các vân gỗ tự nhiên láng mịn, các đường vân thẳng, uốn lượn hay đồng tâm độc đáo tạo nên nét đẹp đặc trưng mang giá trị cao của nội thất gỗ. 
			<br/>
			<br/>
Cấu tạo của sản phẩm bao gồm 2 tầng với tầng trên có nhiệm vụ làm giá đỡ cho tivi, tầng dưới là nơi bạn có thể kê các vật dụng liên quan như loa, đầu đĩa, điều khiển… Đồng thời kệ tivi còn được tích hợp 4 hộc tủ và một ngăn tủ lớn được bố trí đối xứng. Các chi tiết được tính toán tỉ mỉ, chính xác để giúp bạn sử dụng dễ dàng hơn và đảm bảo mỗi bộ phận đều có nét đẹp riêng và hài hòa với nhau.
			<br/>
			<br/>
Để tạo nên nét nghệ thuật cho kệ tivi, các họa tiết pano mạnh mẽ được lồng ghép đường viền uốn lượn mềm mại hòa quyện vào nhau giúp sản phẩm thêm phần nổi bật. Hai cửa sổ bát giác với hoa văn mắt lưới tạo chiều sâu thị giác hiệu quả. Đồng thời họa tiết hoa bốn cánh được chạm nổi tạo nét nhẹ nhàng, thanh nhã cho tổng thể thiết kế.  
			<br/>
			<br/>
Yếu tố góp phần không nhỏ trong quá trình đem lại vẻ ngoài sang trọng cho kệ tivi chính là vát góc ở tầng trên của sản phẩm tăng thêm sự uyển chuyển và đem lại góc nhìn rộng thoáng hơn. Thiết kế này còn góp phần làm cho sản phẩm bớt đi phần thô cứng đặc trưng của gỗ tự nhiên, mềm mại và tiện lợi hơn trong quá trình sử dụng. Đồng thời dễ dàng kết hợp với những món đồ nội thất khác của bạn.
		</p>',
'ke-tivi-vat-go-go-do-tu-nhien-dep-gia-re.jpg'),
('Kệ Tivi Hiện Đại Gỗ sồi Nga Chân Vuông Đẹp Giá Rẻ', 5700000, 37, 'Kệ Ti Vi', 
'<p>Tổng thể mang vẻ đẹp mạnh mẽ, lịch lãm nhưng chi tiết lại được làm “mềm” hơn với những đường nét uyển chuyển đầy cuốn hút. Sản phẩm có kiểu dáng hình chữ nhật bao bọc bởi một đường viền gỗ được bo cong ở các góc cạnh. Bên trong là những ô, khối vuông vức làm từ gỗ nguyên tấm với tạo dáng độc đáo, mới lạ. Thiết kế hộc tủ tay nắm âm chế tác đối xứng tạo nên sự cân đối cho thiết kế. 
			<br/>
			<br/>
Kệ tivi sở hữu tông màu tươi sáng, vừa trẻ trung vừa ấm cúng tạo điểm nhấn cho không gian phòng khách của gia đình. Những đường vân gỗ sắc nét uốn lượn mộc mạc, gần gũi chạy trên mặt kệ khi được chiếu sáng lại càng rực rỡ hơn. Bên ngoài kệ tivi được phun sơn PU 5 lớp chất lượng cao tạo độ bóng bẩy đồng thời bảo vệ sản phẩm tốt hơn khỏi các tác động của môi trường. 
			<br/>
			<br/>
Và để sản phẩm hoàn thiện tốt nhất thì chúng tôi sử dụng gỗ sồi Nga làm chất liệu chế tác. Gỗ được nhập khẩu trực tiếp từ châu Âu, sau đó được xử lý, tẩm sấy trên dây chuyền công nghệ cao. Vì vậy, kệ tivi luôn đảm bảo được sự chắc chắn, bền bỉ trong khi sử dụng. Dòng gỗ tự nhiên còn an toàn cho sức khỏe của người sử dụng, thân thiện với môi trường và có tuổi thọ sử dụng lâu dài nên bạn có thể hoàn toàn an tâm dùng cho gia đình. 
			<br/>
			<br/>
Mẫu kệ tivi này phù hợp cho các không gian phòng khách trung bình và phòng khách rộng rãi với 3 kích thước lần lượt là 200 x 60 x 40cm, 220 x 60 x 40cm và 240 x 60 x 40cm. Sự hài hòa giữa các số đo của sản phẩm sẽ đem lại tính mỹ quan tối ưu cho ngôi nhà, tạo nên giá trị thẩm mỹ cao nhất.
		</p>',
'ke-tivi-hien-dai-go-soi-nga-chan-vuong-dep-gia-re.jpg'),
('Kệ Tủ Để Tivi Gỗ Gõ Đỏ 2M Hiện Đại Bền Đẹp Giá Rẻ', 5800000, 79, 'Kệ Ti Vi', 
'<p>Mẫu kệ tivi đẹp KV721 là lựa chọn tốt cho những không gian phòng khách rộng rãi với 3 kích thước lớn tùy chọn là 200, 220,240cm. Diện tích mặt bàn lớn (sâu 40cm) phù hợp với những loại tivi từ 35-70 inch, những bộ loa loại lớn từ 60 – 150 (lít).
			<br/>
			<br/>
Kệ gỗ tivi được thiết kế dạng 2 tầng gồm 1 tầng để tivi, 1 tầng để bày trí phụ kiện trang trí hoặc đồ dùng. Ngoài ra kệ còn được gắn thêm 4 hộc kéo loại nhỏ có gắn ray trượt tiện lợi, dễ thao tác, rất thích hợp với những gia đình có nhu cầu sử dụng nhiều.
			<br/>
			<br/>
Kết cấu tủ được hoàn thiện với 4 chân đều nhau, lưng kệ được gắn thêm những tấm gỗ đảm bảo tính liền mạch cho thiết kế. Tầng 2 được gắn liền với tầng 1, mặt tầng được làm liền với kích thước lớn giúp tán lực hiệu quả. Giảm áp lực tốt cho mặt kệ, đảm bảo tính an toàn & độ bền vững cho sản phẩm.
			<br/>
			<br/>
Phụ kiện tủ bao gồm thanh ray trượt, tay nắm tủ được làm từ inox không gỉ được mạ đồng công nghiệp, giữ cho màu sắc đẹp, tương đồng với màu sắc gỗ. Ray trượt có thể tháo lắp dễ dàng, nhanh chóng sửa chữa, thay mới nếu có vấn đề phát sinh trong quá trình sử dụng.
			<br/>
			<br/>
Kệ được làm hoàn toàn từ chất liệu gỗ gõ đỏ tự nhiên 100%, đảm bảo chất lượng tốt, ưu điểm là màu sắc sáng, vân gỗ đẹp và đều nhau. Gỗ đã được xử lý tốt tăng cường khả năng chống ẩm mốc, mối mọt, đáp ứng độ bền tiêu chuẩn từ 50 – 70 năm. Mang lại giá trị sử dụng hữu ích nhất cho khách hàng.
		</p>',
'ke-tu-de-tivi-go-go-do-2m-hien-dai-ben-dep-gia-re.jpg'),
('Kệ Tivi Gỗ Sồi Nga Màu Nâu Kéo Dài Hiện Đại Đẹp Giá Rẻ', 6500000, 97, 'Kệ Ti Vi', 
'<p>Sở hữu kiểu dáng độc đáo với những đường cong uốn lượn, những góc cạnh bo tròn uyển chuyển. Bề mặt được làm trơn, láng mịn làm nổi bật nên màu sắc đặc trưng của chất liệu gỗ. Làm nổi bật nên những đường vân gỗ đẹp & hấp dẫn nhất tạo nên nét đẹp tự nhiên cho sản phẩm.
			<br/>
		</p>',
'ke-tivi-go-soi-nga-mau-nau-keo-dai-hien-dai-dep-gia-re.jpg'),
('Kệ Để Tivi Gỗ Gõ Đỏ Phong Cách Cổ Điển Đẹp Cao Cấp', 25000000, 7, 'Kệ Ti Vi', 
'<p>Mẫu kệ tivi đẹp KV701C thiết kế theo kiểu 2 tầng gồm 1 tầng mặt kệ & 1 tầng hộc kệ để đồ riêng biệt. Mặt kệ để tivi được làm rộng rãi với bề mặt sâu tới 40cm. Mặt ngang dài tối thiểu (120), tối đa (240cm) phù hợp với kích thước của hầu hết các loại kệ tivi trên thị trường hiện nay. Từ các loại 30 – 35 inchs cho đến các loại siêu lớn từ 70 – 90 inchs đều có thể đáp ứng tốt.
			<br/>
			<br/>
Tầng kệ gỗ để tivi phía dưới được chia thành 2 hộc nhỏ có ngăn kéo chuyên dụng giúp việc thao tác đóng mở nhanh chóng dễ dàng. Với 2 tầng kệ đơn 2 hộc bên hông khách hàng có thể bày trí những đồ dùng trang trí, vật phẩm sử dụng thiết yếu như các loại điều khiển tivi, phụ kiện âm thanh như loa đài, âm ly, sách báo…
			<br/>
			<br/>
Kết cấu kệ ổn định với 4 chân kệ làm chắc chắn, tiết kiện bề mặt chân lên tới 4cm cố định sản phẩm tốt hơn. Các tấm kệ gỗ, khung gỗ được làm dày 8cm, các chi tiết chính như tầng kệ, hộc kéo, vai, hậu tủ, khung sườn được kết nối liền mạch với nhau, đảm bảo khả năng chịu lực tốt, tải trọng tối đa từ 150 – 200kg.
			<br/>
			<br/>
Hoàn thiện từ chất liệu gỗ xoan đào tự nhiên được sản xuất trên dây chuyền công nghệ hiện đại. Hạn chế tối đa tình trạng cong vênh, mối mọt, ẩm mốc trong nhiều điều kiện môi trường, khí hậu khác nhau. Với tuổi thọ tối thiểu (10 năm), tối đa (30 năm) được đánh giá là một lựa chọn tốt để phục vụ bạn trong thời gian dài, tiết kiệm chi phí mua sắm tốt cho gia đình.
		</p>',
'ke-de-tivi-go-go-do-phong-cach-co-dien-dep-cao-cap.jpg'),

('Giường Ngủ Gỗ Xà Cừ Vạt Phản Đẹp Giá Rẻ Bình Dân', 5650000, 24, 'Giường Ngủ', 
'<p>Giường ngủ gia đình gỗ xa cừ được thiết kế đơn giản với kiểu khối hộp chân cao tiện lợi với việc sử dụng của khách hàng. Với phần chân và vai giường được làm cao hơn mang lại cảm giác rộng rãi hơn cho không gian. Gầm giường lớn giúp cho việc vệ sinh tiện lợi & dễ dàng hơn.
			<br/>
			<br/>
Đầu giường cao 90cm làm từ gỗ nguyên tấm phẳng mịn, gỗ có khổ lớn dạng bảng rộng tạo cảm giác cứng cáp cho sản phẩm. Bề mặt được làm trơn láng mịn làm nổi bật lên màu sắc tự nhiên và nét đẹp đặc trưng của vân gỗ xà cừ. 
			<br/>
			<br/>
Đuôi giường chạm họa tiết pano đối xứng tạo cảm giác cân bằng và hải hòa cho tổng thể sản phẩm. Chân trụ ở 4 góc làm dày tới 8cm cùng vai giường dày 3cm tạo nên một bộ khung giường vững chãi, bền chắc, tăng cường khả năng chịu lực một cách hiệu quả nhất. Khung nằm được thiết kế sâu 1,5cm giúp việc cố định nệm chắc chắn hơn, không xê dịch. Có thể sử dụng tốt với những tấm nệm dày từ 5 - 20cm.
			<br/>
			<br/>
Sản phẩm sử dụng bộ vạt phản từ gỗ tự nhiên giúp mặt giường dẻo dai, không bị cong trũng, hư gãy khi sử dụng. Giường được cố định chắc chắn với các mộng gỗ ghép nối liền mạch, không gây tiếng ồn khó chịu khi trở mình như các mẫu giường gỗ công nghiệp, giường sắt khác. 
			<br/>
			<br/>
Mẫu giường gỗ giá rẻ này được làm từ gỗ xà cừ cực kỳ phù hợp với khí hậu Việt Nam. Gỗ trong quá tình chế tác được xử lý kỹ càng để chống được mối mọt, ẩm mốc và nứt nẻ. Các chi tiết hoàn toàn làm từ gỗ 100% không dùng gỗ kém chất lượng đảm bảo độ bền > 20 năm sử dụng
		</p>',
'giuong-ngu-go-xa-cu-vat-phan-dep-gia-re-binh-dan.jpg'),
('Giường Ngủ Gỗ Xà Cừ Đẹp Giá Rẻ Bình Dân', 4800000, 10, 'Giường Ngủ', 
'<p>Giường ngủ đẹp giá rẻ GN681C được đánh giá là một trong những lựa chọn đáng giá nhất trong phân khúc hàng giá rẻ. Với ưu điểm là mức giá siêu cạnh tranh, độ bền ổn định, thiết kế đẹp, chất lượng tốt, tuổi thọ >20 năm. Sản phẩm đáp ứng tốt toàn bộ những yêu cầu cơ bản của người dùng như chịu được tải trọng lớn từ 200 – 300kg, không gây âm thanh ồn ào khi chịu tác động lực có cường độ mạnh…
			<br/>
			<br/>
Mẫu giường gỗ giá rẻ tphcm GN681C thiết kế theo phong cách hiện đại đơn giản với đầu giường dạng trơn, mặt gỗ liền nguyên tấm làm nổi bật nên những vân gỗ mộc đẹp nhất. Đuôi giường kiểu pano chân cao giúp cho thiết kế trở lên thanh thoát, gọn gàng hơn so với loại giường hộp truyền thống. Nhìn chung, sản phẩm chú trọng nhiều đến vân gỗ + màu sắc gỗ tự nhiên vừa đảm bảo tính thẩm mỹ tốt, đồng thời còn giúp giảm thiểu tối đa chi phí nhân công khi chế tác hay chạm trổ các họa tiết trang trí.
			<br/>
			<br/>
Vai giường làm cao cách mặt sàn ~30cm giúp khách hàng dễ dàng trong việc vệ sinh gầm giường. Vạt giường kiểu vạt nan cơ bản, kết hợp với vai giường cao hơn giúp lưu thông khí tốt hơn, không gây bí bách cho người nằm. Ngoài ra vạt giường được làm liền nhau hơn ~1cm, bề mặt tấm gỗ lớn, bằng nhau không gây cảm giác cấn khó chịu dù cho khách hàng có nằm trên chiếu cói thay vì các loại nệm ngủ.
			<br/>
			<br/>
Để giảm thiểu tối đa chi phí sản xuất sản phẩm được hoàn thiện từ gỗ xà cừ tự nhiên, một loại gỗ có mật độ phân bố lớn tại Việt Nam. Gỗ vẫn đảm bảo độ cứng cáp tốt, độ ổn định cao chống chịu lực hiệu quả. Ngoài ra giường còn được trợ giá lên tới 20% với chi phí giao hàng 0đ trong toàn bộ khu vực nội thành TPHCM đảm bảo chi phí khách hàng bỏ ra là tiết kiệm nhất.
		</p>',
'giuong-ngu-go-xa-cu-dep-gia-re-binh-dan.jpg'),
('Giường Ngủ Gỗ Xoan Đào Gia Lai Cao Cấp Vạt Phản Đẹp Giá Rẻ', 10500000, 25, 'Giường Ngủ', 
'<p>Thiết kế giường ngủ được sử dụng phong cách hiện đại tối giản với tổng thể hình chữ nhật vuông vắn. Khung giường, vạt giường được chế tác từ gỗ nguyên khối rắn chắc có khả năng chịu lực tốt giúp nâng đỡ cơ thể người nằm khiến bạn luôn an tâm trong quá trình nghỉ ngơi. 
			<br/>
			<br/>
Sở hữu thiết kế theo phong cách tự nhiên tuyệt vời với những khối gỗ được giữ nguyên nét tự nhiên trầm ấm của gỗ xoan đào với gam màu đỏ nâu đặc trưng. Các đường nét vân gỗ uyển chuyển tôn lên vẻ đẹp mộc mạc tạo sự thoải mái cho khách hàng. 
			<br/>
			<br/>
Họa tiết 5 dòng kẻ đối xứng cùng hoa lá theo phong cách cổ điển được chạm khắc ở đỉnh giường và đuôi giường mềm mại, nhẹ nhàng. Hoa văn họa tiết được chạm nổi trên sản phẩm kết hợp với vẻ đẹp của chất liệu gỗ là sự kết hợp hoàn hảo của tính nhân tạo và chất tự nhiên độc đáo nhất.
			<br/>
			<br/>
Thiết kế vạt phản tiện lợi tạo thành một tổng thể hoàn hảo, đảm bảo các chi tiết khi ráp nối lại với nhau không bị hở hay cong vênh. Không phát ra những âm thanh khó chịu ảnh hưởng đến giấc ngủ của người dùng. Đồng thời vạt phản còn giúp việc bỏ nệm và di chuyện nệm tiện lợi hơn rất nhiều so với vạc nan.
			<br/>
			<br/>
Mẫu giường này được đánh giá là lựa chọn phù hợp với nhiều đối tượng khách hàng từ trẻ tuổi, lớn tuổi và trung tuổi với thiết kế mang tính trung tính vừa đơn giản lại tinh tế thích hợp với thị hiếu của mọi người. Bạn có thể dễ dàng kết hợp với những món đồ nội thất trong phòng ngủ của mình mà không phải lo lắng về vấn đề "lệch tông" trong thiết kế hay phong cách.
		</p>',
'giuong-ngu-go-xoan-dao-gia-lai-cao-cap-vat-phan-dep-gia-re-3.jpg'),
('Giường Ngủ Gỗ Tự Nhiên Đinh Hương Cao Cấp Vạt Phản Đẹp Giá Rẻ', 12500000, 25, 'Giường Ngủ', 
'<p>Giường ngủ gỗ tự nhiên đinh hương được thiết kế theo phong cách hiện đại, trẻ trung với những đường nét vuông vắn, góc cạnh. Những chi tiết, họa tiết, hoa văn được tinh giản một cách tối đa nhất để đảm bảo sự gọn gàng cho sản phẩm, đồng thời thể hiện toàn bộ vẻ đẹp của chất gỗ tự nhiên với màu sắc đẹp & vân gỗ đặc trưng nhất.
			<br/>
			<br/>
Đầu giường và đuôi giường được làm theo kiểu bảng lớn hình chữ nhật với khổ rộng, cả 2 bộ phận đều được chọn lựa từ những tấm gỗ lớn nhất, có màu sắc và hoa văn tương đồng với nhau. Được làm với kích thước tương đồng nhau tạo cảm giác cân bằng và hài hòa cho tổng thể thiết kế. Bề mặt được chạy chỉ đơn giản với họa tiết hoa nở cách điệu chạm nổi tạo thêm chút điểm nhấn thú vị cho sản phẩm.
			<br/>
			<br/>
Vạt giường được làm dạng vạt phản với những tấm gỗ lớn được ghép đều lại với nhau. Ưu điểm của loại vạt này là khả năng bám sát với giường tốt hơn, bề mặt phẳng và đều nhau hơn. Giúp cho việc nằm ngủ thoải mái hơn, khi đặt nệm đảm bảo an toàn tốt hơn rất nhiều so với loại vạt nan truyền thống.
			<br/>
			<br/>
Vai giường được làm cao khoảng 10cm so với mặt sàn, giúp cho việc vệ sinh gầm giường dễ dàng hơn so với loại giường ngủ gia đình dạng bệt. Tuy nhiên để đảm bảo khả năng chịu lực tốt nhất vạt giường được gắn sâu vào bề mặt 4 phần chân giường. Được đóng mộc nối chìm để tăng khả năng kết nối giữa các bộ phận lại với nhau. Chân giường được làm lớn hơn theo kiểu chân vuông giúp phân bố lực một cách đồng đều nhất. Góp phần nâng cao tuổi thọ cho sản phẩm & nâng cao trải nghiệm cho người dùng.
		</p>',
'giuong-ngu-go-tu-nhien-dinh-huong-cao-cap-vat-phan-dep-gia-re.jpg'),
('Giường Ngủ Gỗ Gỏ Đỏ Vạt Phản Đẹp Giá Tốt', 18500000, 52, 'Giường Ngủ', 
'<p>Điểm đầu tiên để nói về mẫu giường này có thể nói đến thiết kế rất đẹp mà bắt mắt. Nổi bật và cuốn hút nhất có thể kể đến những đường vân gỗ chạy đều trên bề mặt sản phẩm. Những vân gỗ tự nhiên từ gỗ với nhiều cấu trúc khác nhau mang đến vẻ đẹp đặc biệt và cực kỳ độc đáo. Toàn bộ mặt phủ bên ngoài giường từ đầu giường, vai, đuôi, tvac giường đều được chọn lựa từ những tấm gỗ có nhiều vân đẹp nhất tạo nên vẻ đẹp độc đáo và cực kỳ cuốn hút.
			<br/>
			<br/>
Sở hữu thiết kế khá đơn giản với dạng hình khối vuông với các chi tiết nối nhau cân bằng gần như hoàn hảo, tạo cảm giác chắc chắn và vững trãi cho người xem. Đây là sự kết hợp khá khéo léo giữa cấu trúc và thiết kế giường khi nhà sản xuất chọn lựa sự đơn giản của cấu trúc giường để làm nền cho phần hoạ tiết gỗ tự nhiên được nổi bật và trở lên ấn tượng hơn.
			<br/>
			<br/>
Sản phẩm được hoàn thiện từ gỗ gõ đỏ tự nhiên với đặc trưng là màu vàng gõ giúp giường trở lên sáng và nổi bật hơn nhiều so với các tối của gỗ xoan đào hay gỗ căm xe. Theo thời gian giường sẽ ngả dần sang màu đỏ rực càng giúp gường trở lên đẹp và ấn tượng hơn. Nếu bạn yêu thích những sản phẩm có khả năng "biến hình" độc đáo thì đây là lựa chọn khá tuyệt vời.
			<br/>
			<br/>
Kết cấu của giường được thiết kế theo kiểu đồng nhất và cân bằng với nhau, đặc biệt quan trọng với những loại giường dùng vạt phản hay vì vạt nan. Các thành phần như đầu, vai, đuôi, vạt được tính toán với độ chính xác gần như là hoàn hảo nhất. Các chi tiết được ghép nối với nhau theo một kết cấu chuẩn mực giúp tăng thêm khả năng phân bố lực, hạn chế tình trạng va chạm giữa những chi tiết trên sản phẩm phát ra những âm thanh gây khó chịu với người dùng.
		</p>',
'giuong-ngu-go-go-do-vat-phan-dep-gia-tot.jpg'),
('Giường Ngủ Gỗ Hương Đá Cao Cấp Vạt Phản Đẹp Giá Rẻ', 17500000, 17, 'Giường Ngủ', 
'<p>Giường ngủ gia đình giá rẻ GN761E là mẫu giường vạt phản chất lượng tốt, được đánh giá cao về tính ổn định trong kết cấu, khả năng chịu lực hiệu quả, tải trọng tối đa từ 200 – 300kg. Tấm vạt phản dày chắc chắn với phần bề mặt nhẵn mịn, làm sâu ~1cm vào bên trong giường giúp sản phẩm giữ được tính ổn định lâu dài. Phù hợp với hầu hết các loại nệm ngủ, chiếu ngủ thông dụng trên thị trường hiện nay.
			<br/>
			<br/>
Đầu giường & đuôi giường gỗ làm kiểu pano trơn với phần bề mặt được làm trơn láng, quét sơn bóng mờ đẹp mắt. Đỉnh giường làm hơi cong tạo cảm giác êm ái khi tựa lưng. Phần khung giường làm dày ~8cm, chân giường làm rộng tạo độ chắc chắn, làm điểm tựa tốt cho tổng thể sản phẩm.
			<br/>
			<br/>
Vai giường làm cao ~15cm tạo cảm giác thông thoáng, loại bỏ tình trạng bí bách khi nằm trong thời gian dài. 2 vai giường làm cao giúp cho việc vệ sinh gầm giường dễ dàng hơn, đủ không gian để những loại máy hút bụi mini di chuyển để làm sạch.
			<br/>
			<br/>
Thang giường gồm 5 tấm gỗ lớn dày~5cm đảm bảo khả năng chịu lực tốt, được cố định nối bằng các tấm sắt chuyên dụng đảm bảo tính cân bằng giữa 2 phần trên & dưới của giường.
			<br/>
Giường được làm từ chất liệu gỗ hương đá tự nhiên chất lượng tốt, đảm bảo độ bền lâu dài từ 20 – 30 năm. Gỗ đã được xử lý loại bỏ tình trạng cong vênh hay biến dạng khi chịu nhiệt độ cao. Ngoài ra, Nội Thất Đồ Gỗ Việt cam kết bảo hành 05 năm với tất cả các lỗi phát sinh do chất liệu gỗ như co ngót, mối mọt… để khách hàng có thể yên tâm tuyệt đối khi lựa chọn sản phẩm này cho phòng ngủ gia đình.
		</p>',
'giuong-ngu-go-huong-da-cao-cap-vat-phan-dep-gia-re.jpg'),
('Giường Ngủ Gỗ Gõ Đỏ Đầu Vòm Vạt Phản Đẹp Giá Rẻ', 19500000, 10, 'Giường Ngủ', 
'<p>Giường ngủ gỗ gõ đỏ đầu vòm là mẫu thiết kế hoàn thiện theo phong cách cổ điển thuần Việt với những đường nét uốn lượn tinh tế, những hoa văn xòe quạt độc đáo. Sản phẩm được tối ưu hóa với những chi tiết chạm nổi trên bề mặt gỗ giúp hoa văn trở lên nổi bật và ấn tượng hơn. Kết hợp với lớp vân gỗ và màu sắc đặc trưng của chất liệu gõ đỏ đậm chất mộc mạc cuốn hút.
			<br/>
			<br/>
Đầu giường làm cao 115cm với phần đỉnh hơi nhô lên để người dùng có thể tựa lưng khi ngồi đọc sách hoặc xem phim trong phòng ngủ. Đuôi giường cao 48cm vừa đủ để không che đi đầu giường khi quan sát giường từ phía chính diện. Đầu và đuôi giường làm dạng bảng rộng được chia thành 2 bên trái phải, mỗi bên đều chạm các hoa văn tương đồng nhau tạo nên sự tương xứng & cân bằng về thẩm mỹ cho sản phẩm.
			<br/>
			<br/>
Vai giường làm cao 41cm, phần gầm giường cao tới 10cm đảm bảo sự thông thoáng cho không gian bên dưới giường. Có thể vệ sinh dễ dàng bằng máy hút bụi cầm tay hay các loại máy hút mini thông dụng trên thị trường hiện nay.
			<br/>
			<br/>
2 Vạt giường dạng vạt tấm có kích thước 90 x 200cm, vạt làm dày ~5cm rất chắc chắn, khả năng chịu lực cực tốt, mặt hậu làm chìm sâu giúp cố định vạt ổn định. Không rung lắc hay kêu khi đứng hoặc nằm phía trên.
			<br/>
			<br/>
Kết cấu giường phòng ngủ liền mạch gồm 2 vai giường, 1 đầu giường, 1 đuôi, 5 tấm thang giường, 2 vạt giường được đóng mộng gỗ chắc chắn. Giữa các chi tiết đều có các gờ khớp nối chính xác cố định tốt, không xê dịch khi sử dụng trong thời gian dài. Đảm bảo độ bền chắc của sản phẩm từ 20 – 30 năm.
		</p>',
'giuong-ngu-kieu-nhat-go-xoan-dao-tu-nhien-cao-cap-dep-gia-tot-1.jpg'),



('Tủ Để Quần Áo Gia Đình 4 Cánh Gỗ Sồi Màu Nâu Đẹp Giá Rẻ', 9500000, 2, 'Tủ Quần Áo', 
'<p>Tủ áo TA801C2 là lựa chọn lý tưởng dành riêng cho gia đình có từ 4 – 6 thành viên cùng nhau sử dụng. Hướng tới tính ứng dụng thực tiễn với 3 ngăn treo rộng rãi có thể bảo quản số lượng quần áo lớn. Giữ cho quần áo được thẳng thớm, không nhăn nheo, không gấp nếp, đặc biệt phù hợp với khách hàng có nhiều đầm, váy dài, suit nam sử dụng. Ngoài ra tủ được thiết kế thêm 2 ngăn xếp, 1 hộc kéo âm để xếp các loại khăn hay quần áo ngắn… tiện lợi hơn.
			<br/>
			<br/>
Kết cấu tủ đựng quần áo gỗ chắc chắn với 4 tấm vai, đáy, đỉnh tủ được làm dày ~10cm, các chi tiết được đóng mộc chắc chắn, liền mạch với nhau. Giữa các khớp nối được bắt vát ốc cẩn thận, đảm bảo tải trọng tối đa từ 150 – 200kg.
			<br/>
			<br/>
Chân tủ gắn mút cao su đế dày tới 3cm, độ bám dính tốt, không bị xê dịch khi sử dụng, khả năng chịu tải trọng lớn, không nứt vỡ khi chịu tải trọng trong một thời gian dài.
			<br/>
			<br/>
Tủ có thể tháo lắp dễ dàng dù nhà nằm trong hẻm nhỏ vận chuyển khó khăn đều có thể di chuyển được. Được chia thành 12 bộ phận lớn nhỏ có thể lắp ráp nhanh chóng chỉ từ 15 – 30 phút. Rất thích hợp với những gia đình thường xuyên thay đổi nơi ở hay vị trí nhà có giao thông không thuận lợi.
			<br/>
			<br/>
Sản phẩm làm từ chất liệu gỗ sồi nga tự nhiên 100%, bề mặt làm trơn, mặt được bào nhẵn, không có dăm gỗ nhỏ, mặt ngoài không có lỗ đinh như gỗ tái chế rẻ tiền. Cam kết hoàn trả 1 đổi 1 nếu là gỗ tạp, hàng đã qua sử dụng không đạt yêu cầu chất lượng như cam kết.
		</p>',
'tu-de-quan-ao-gia-dinh-4-canh-go-soi-mau-nau-dep-gia-re.jpg'),

('Tủ Quần Áo Gỗ Hương Đá Chạm Khắc Đẹp Giá Rẻ', 48500000, 7, 'Tủ Quần Áo', 
'<p>Tủ áo được thiết kế gồm 3 cánh mở loại lớn với những tay nắm mộc hình con thoi được chạm dạng xoắn ốc khá độc đáo. Mặt cánh tủ dạng pano cổ điển với những hoa văn cuộn tinh tế với những đường viền nhẹ chạy đối xứng. Đươc chọn lựa từ tấm gỗ lớn có vân gỗ đẹp với những đường vân uyển chuyển, là lựa chọn lý tưởng cho khách hàng yêu thích phong cách mộc, đậm chất cổ điển theo kiểu dáng hoàng gia châu Âu.
			<br/>
			<br/>
Nội thất tủ rộng rãi với 3 buồng riêng biệt được chia thành 3 ngăn treo chuyên dụng, 4 ngăn xếp, 1 hộc kéo âm phục vụ tốt nhu cầu của những gia đình có đông thành viên. Các ngăn xếp được thiết kế linh hoạt để khách hàng có thể dễ dàng thay đổi tùy theo mục đích sử dụng.
			<br/>
			<br/>
Kết cấu tủ áo gỗ tự nhiên ổn định với những chi tiết được tính toán tỉ mỉ, từng bộ phận được ghép nối một cách chuẩn mực nhất. Đảm bảo tính liền mạch giữa các khớp ghép nối, giữ cho kết cấu tủ luôn được chắc chắn, ổn định. Giảm thiểu tối đa sự ma sát giữa các chi tiết, tăng thêm độ bền một cách tối đa. Dù tháo lắp thường xuyên vẫn không ảnh hưởng tiêu cực đến chất lượng sản phẩm.
			<br/>
			<br/>
Phụ kiện tủ gồm tay nắm tủ, thanh treo áo quần, cho đến những tấm gỗ làm tủ đều được làm từ gỗ hương đá tự nhiên cao cấp. Chất gỗ tốt, đảm bảo tiêu chuẩn chất lượng, đã được xử lý giảm thiểu tối đa tình trạng cong vênh, mối mọt. Tay nắm, bản lề tủ, khóa tủ làm từ inox không gỉ cao cấp đảm bảo độ bền ổn định với tuổi thọ lên tới > 50 năm.
		</p>',
'tu-quan-ao-go-huong-da-cham-khac-dep-gia-re.jpg'),



('Tủ Quần Áo Đẹp Gỗ Hương Đá Tự Nhiên Cao Cấp Giá Tốt', 19000000, 2, 'Tủ Quần Áo', 
'<p>Tủ đựng quần áo TA761 được thiết kế theo phong cách hiện đại với những đường nét vuông vắn, góc cạnh. Hướng đến vẻ đẹp tự nhiên, mộc mạc với màu sắc, vân gỗ đặc trưng của chất liệu gỗ hương đá. Tạo nên phong cách riêng hoàn toàn khác biệt so với những mẫu tủ áo đại trà trên thị trường hiện nay.
			<br/>
			<br/>
Tủ gồm 4 cánh mở loại lớn được thiết kế theo dạng pano cổ điển. Mặt cánh tủ gồm những vân gỗ đẹp, đồng đều với nhau tạo cảm giác cân bằng và đồng đều cho tổng thể sản phẩm. Với những tấm gỗ lớn, màu sắc sáng, được phủ thêm một lớp sơn bóng mờ tuyệt đẹp. Giúp tủ trở lên đặc biệt nổi bật hơn khi được sử dụng dưới ánh đèn phòng ngủ hay ánh sáng tự nhiên.
			<br/>
			<br/>
Nội thất tủ khá lớn bao gồm 2 buồng treo lớn, 1 buồng xếp rộng rãi với nhiều hộc tủ nhỏ, mỗi ngăn được chia theo nhiều mục đích khác nhau để người dùng tận dụng tối đa không gian bên trong. Đồng thời tủ còn được gắn thêm 3 hộc kéo âm loại lớn để khách hàng có thêm lựa chọn để sử dụng. Đáp ứng tốt nhu cầu của những gia đình có nhiều thành viên từ 4 – 6 người.
			<br/>
			<br/>
Sản phẩm hoàn thiện với 6 chân trụ được làm hơi cong nhẹ giúp cân bằng những đường nét thô cứng trong tổng thể thiết kế. Với 6 chân đảm bảo khả năng chịu lực & tính ổn định tốt hơn so với những loại tủ 4 chân thông thường. Chân có gắn đế cao su hạn chế tình trạng ẩm mốc từ mặt sàn có thể gây ảnh hưởng đến sản phẩm. Đồng thời giúp khách hàng có thể tiện lợi hơn trong việc vệ sinh, lau chùi.
			<br/>
			<br/>
Phụ kiện tủ áo gỗ tự nhiên gồm thay ray trượt, bản lề hơi, khóa nam châm, tay nắm hộc tủ đều được làm từ inox không gỉ cao cấp. Đảm bảo khả năng vận hành trơn tru, bền vững theo thời gian. Thanh treo áo quần, hậu tủ, hộc treo đồ đều làm từ gỗ nguyên chất, chất lượng tương đồng với gỗ làm tủ. Đảm bảo tuổi thọ tủ >50 năm để đáp ứng tốt những yêu cầu của người sử dụng.
		</p>',
'tu-quan-ao-dep-go-huong-da-tu-nhien-cao-cap-gia-tot.jpg'),

('Tủ Để Quần Áo Gỗ Hương Nhóm 1 Đẹp Giá Rẻ 4 Cánh Mở', 18000000, 7, 'Tủ Quần Áo', 
'<p>Tủ treo áo quần gia đình sở hữu kiểu dáng khối hộp đơn giản, không sử dụng họa tiết cầu kỳ, những hoa văn chạm trổ tinh xảo mà hướng tới sự tinh tế giữa phong cách thiết kế và chất liệu gỗ tự nhiên.  Đảm bảo được yếu tố thẩm mỹ, nét đẹp riêng biệt so với những mẫu đại trà khác trên thị trường hiện nay, đáp ứng tốt giá trị và lợi ích mang tới cho khách hàng.
			<br/>
Cánh tủ thiết kế theo kiểu cánh mở truyền thống, tiện lợi trong việc thao tác, mặt tủ chạm pano đơn giản làm nổi bật lên những vân gỗ mộc tự nhiên, màu sắc đặc trưng của gỗ Hương xám mộc mạc, gần gũi, nhẹ nhàng và thanh lịch.
			<br/>
			<br/>
Nội thất tủ được tối ưu công tối đa nhất khi được tính toán và phân chia thành 1 buồng treo lớn, 1 buồng treo nhỏ, 1 ngăn xếp, 3 hộc kéo tiện dụng. Khách hàng có thể túy ý sử dụng để treo, gấp và cất các vật dụng phòng ngủ như gối, mền, ga giường... theo từng mục đích khác nhau.
			<br/>
			<br/>
Tay nắm gỗ, vách ngăn, khung treo móc áo tạo nên vẻ đẹp đồng điệu và hài hòa với tổng thể thiết kế. Đồng thời cũng hạn chế được các vấn đề hư hỏng, han gỉ như các loại tay nắm đồng hay sắt kém chất lượng khác.
			<br/>
			<br/>
Phụ kiện làm tủ treo quần áo gỗ gồm bản lề giảm chấn, tay nắm hộc kéo, ray trượt thông minh tạo nên những chuyển động mượt mà, êm ái nhất, giảm thiểu tối đa các tiếng ồn khó chịu có thể gây ra khi đóng mở cửa tủ. Tất cả đều làm từ thép cao cấp được mạ lớp inox không gỉ đảm bảo độ bền đẹp theo thời gian, đảm bảo độ bền tủ đạt chất lượng tốt nhất.
		</p>',
'tu-de-quan-ao-go-huong-nhom-1-dep-gia-re-4-canh-mo.jpg'),

('Tủ Quần Áo Gỗ Hương Đá Áp Trần Có Kệ Trang Trí Đẹp Giá Rẻ', 29500000, 77, 'Tủ Quần Áo', 
'<p>Kích thước tổng thể: Ngang 240 x Cao 260 x Sâu 60cm
			<br/>
Kích thước phần tủ 4 cánh: 200cm
			<br/>
Kích thước phần kệ trang trí: 40cm
			<br/>
Chiều cao tủ dưới: 200cm
			<br/>
Chiều cao phần tủ nhỏ trên: 60cm
		</p>',
'tu-quan-ao-go-huong-da-ap-tran-co-ke-trang-tri-dep-gia-re.jpg'),

('Tủ Quần Áo Nhỏ Gỗ Sồi Nga Tự Nhiên Giá Rẻ Bình Dân', 7500000, 20, 'Tủ Quần Áo', 
'<p>Tủ quần áo đẹp giá rẻ TA801C2 thuộc phân khúc tủ áo mini dành riêng cho phòng ngủ nhỏ, khách hàng cá nhân, gia đình có nhu cầu lưu trữ đồ dùng số lượng ít lựa chọn. Với ưu điểm nhỏ gọn, dễ sắp xếp, dễ bày trí, giá thành rẻ, công năng tốt, độ ổn định theo thời gian, xứng đáng là một sản phẩm nên được ưu tiên trong danh sách mua sắm của bạn.
			<br/>
			<br/>
Mẫu tủ quần áo gỗ tự nhiên TA801C2 thiết kế hình chữ nhật, 2 bên vai thẳng vuông góc với tường, rất thích hợp bày trí ở những vị trí như góc tường, góc nhà, gầm cầu thang… để tận dụng tối đa diện tích không gian phòng ngủ. 4 chân tủ được gắn đế cao su dày ~2cm, vấn gỗ hậu tủ dày ~1.5 giúp hạn chế tối đa tình trạng ẩm mốc do đặt sát tường, sát mặt sàn, bạn có thể yên tâm đặt tủ ở bất cứ vị trí nào mà mình mong muốn.
			<br/>
			<br/>
Nội thất tủ áo được chia thành 2 buồng riêng biệt gồm 2 buồng treo, 1 buồng xếp, 1 hộc kéo âm… có thể phục vụ tốt nhu cầu sử dụng từ 1 – 2 người, mỗi ngăn tủ đều có chìa khóa để đảm bảo tính riêng tư cho từng cá nhân. Với chiều sâu tủ lên tới 60cm mỗi ngăn tủ rộng ~55cm hoàn toàn có thể xếp được từ 20 – 30 bộ quần áo các loại.
			<br/>
			<br/>
Thuộc phân khúc giá bình dân sản phẩm được trợ giá từ nhà bán Nội Thất Đồ Gỗ Việt với ưu đãi 15% cho đơn hàng lẻ, 5% tổng giá trị đơn hàng cho các đơn hàng có giá trị > 30 triệu.
			<br/>
			<br/>
Hỗ trợ trả góp 0% qua Visa, thẻ Master, JCB với thủ tục nhanh gọn, thu phí vận chuyển 0đ với toàn bộ đơn hàng giao trong khu vực nội thành TPHCM. Với mức giá & công năng sản phẩm mang lại, hoàn toàn đáp ứng tốt những yêu cầu thiết yếu nhất cho khách hàng.
			<br/>
			<br/>
Các phụ kiện (bao gồm) khác: đế cao su (cách nhiệt), khóa nam châm, bản lề hơi (giảm chấn), thanh treo áo quần , kệ (gỗ sồi).
		</p>',
'tu-quan-ao-nho-go-soi-nga-tu-nhien-gia-re-binh-dan.jpg'),


('Tủ Cất Quần Áo Gỗ Sồi 3 Cánh Mở 2 Buồng Pano Chạm Đẹp Giá Rẻ', 8500000, 10, 'Tủ Quần Áo', 
'<p>Tủ treo áo quần TA801 là mẫu nội thất được thiết kế gồm 3 cánh mở với 2 buồng nội thất rộng rãi. Nội thất tủ rộng rãi gồm 2 buồng treo, 1 buồng xếp, 1 ngăn để đồ & 1 hộc kéo âm. Mang tới không gian rộng để khách hàng có thể sử dụng một cách thoải mái nhất, đáp ứng tốt cho những gia đình có từ 3 – 5 thành viên.
			<br/>
			<br/>
Mẫu tủ áo gỗ này hoàn thiện theo phong cách hiện đại tối giản với những hoa văn chạm trổ đơn giản. Mặt cánh tủ thiết kế dạng pano cổ điển với họa tiết hình bán nguyệt chạm hoa văn cuộn cuốn hút. Kết hợp với những đường vân gỗ mộc độc đáo tạo nên một món đồ nội thất được kết hợp hoàn giữa nét đẹp tự nhiên & tính nhân tạo từ người chế tác
			<br/>
			<br/>
Kết cấu tủ ổn định với phần khung cứng cáp, được chia thành 4 phần gồm 2 vai, mặt trên, mặt dưới, cánh tủ, hậu tủ đều được làm chuẩn xác đến từng mm. Đảm bảo tính ổn định tốt, khả năng kết nối liền mạch, tháo lắp linh hoạt, độ bền lâu dài theo thời gian.
			<br/>
			<br/>
Với 4 chân tủ vững chắc, chân được làm cao 5cm hạn chế việc tiếp xúc với mặt sàn. Chân cao hơn giúp cho việc vệ sinh được dễ dàng, nhanh chóng hơn. 4 chân tủ có gắn đế cao su để hạn chế tình trạng trầy xước mặt sàn, cố định tốt hơn so với chân gỗ thông thường.
			<br/>
			<br/>
Sản phẩm được hoàn thiện từ chất liệu gỗ sồi tự nhiên nhập khẩu với màu nâu mộc thuần đặc trưng. Với khả năng kháng mối mọt tốt, chống thấm hiệu quả, đảm bảo an toàn cho sức khỏe người dùng, giúp lưu trữ đồ dùng luôn được thơm tho, đảm bảo sẽ mang lại những trải nghiệm tích cực nhất cho khách hàng.
		</p>',
'tu-cat-quan-ao-go-soi-3-canh-mo-2-buong-pano-cham-dep-gia-re.jpg'),

('Tủ Để Quần Áo Cho Một Người Gỗ Sồi Nga Màu Nâu Đẹp Giá Rẻ', 7500000, 17, 'Tủ Quần Áo', 
'<p>Mẫu tủ quần áo cá nhân TA801C2 là sản phẩm được thiết kế dành riêng cho khách hàng cá nhân sử dụng với ưu điểm nhỏ gọn, dễ sắp xếp, tiện nghi vừa đủ, giá thành rẻ cạnh tranh, dễ sử dụng, dễ vận chuyển. Khả năng đáp ứng tốt từ 30 – 40 bộ quần áo các loại, là lựa chọn lý tưởng với cá nhân hay các cặp đôi có nhu cầu sử dụng vừa & ít sở hữu cho không gian sống của mình.
			<br/>
			<br/>
Tủ đựng quần áo giá rẻ TA801C2 có kích thước tiêu chuẩn 120 x 200 x 60cm với thiết kế hình chữ nhật vuông, các chi tiết trang trí được làm gọn gàng, dễ bày trí ở góc tường, góc nhà hay góc cầu thang để tận dụng tối đa không gian. Phù hợp với những căn phòng ngủ có diện tích từ 10 – 15m2. Chiều sâu tủ 60cm, khách hàng có thể xếp hay treo đồ dùng theo nhiều mục đích sử dụng khác nhau.
			<br/>
			<br/>
Không gian nội thất tủ gồm 2 buồng treo loại lớn ~170cm để khách hàng có thể treo loại nhiều áo quần, váy, âu phục… thoải mái không gây sờn viền, cong nếp đồ dùng. Ngoài ra tủ còn có thêm 1 hộc kéo âm có ray trượt để bạn có thể bỏ thêm phụ kiện, đồ dùng cá nhân gọn gàng, ngăn nắp hơn.
			<br/>
			<br/>
Kết cấu tủ áo gỗ đơn giản gồm 2 thanh vai, 1 mặt hậu lưng, 2 cánh tủ, 1 chân tủ, 1 nóc tủ nhỏ gọn & 1 số phụ kiện đơn giản có thể tháo rời, lắp ráp nhanh chóng. Rất thích hợp với khách hàng thường xuyên thay đổi vị trí sử dụng hay nhà ở. Các chi tiết khi được sản xuất đều được tính toán kỹ lưỡng để đạt được độ ổn định tốt, với tuổi thọ lên tới >30 năm, có thể tháo lắp thường xuyên nhưng không ảnh hưởng đến chất lượng sản phẩm.
		</p>',
'tu-de-quan-ao-cho-mot-nguoi-go-soi-nga-mau-nau-dep-gia-re.jpg');


CREATE TABLE `ProductSale` (
    `idProduct` INT NOT NULL,
    `salePercent` TINYINT NOT NULL, 
    `startDateSale` DATE NOT NULL, 
    `endDateSale` DATE NOT NULL,
    FOREIGN KEY (`idProduct`) REFERENCES `Product`(`id`) ON DELETE CASCADE
);
INSERT INTO `ProductSale`(`idProduct`, `salePercent`, `startDateSale`, `endDateSale`) VALUES
(1, 10, '2022-01-27', '2022-02-24'),
(1, 24, '2022-05-24', '2022-08-25'),
(5, 10, '2022-01-27', '2022-02-24'),
(5, 24, '2022-05-24', '2022-09-25'),
(7, 11, '2022-05-24', '2022-09-25'),
(9, 10, '2022-05-24', '2022-09-25'),
(10, 17, '2022-05-24', '2022-09-25'),
(15, 20, '2022-05-24', '2022-09-25'),
(17, 25, '2022-05-24', '2022-09-25'),
(20, 27, '2022-05-24', '2022-09-25'),
(24, 10, '2022-05-24', '2022-09-25'),
(27, 15, '2022-05-24', '2022-09-25'),
(28, 19, '2022-05-24', '2022-09-25'),
(29, 20, '2022-05-24', '2022-09-25'),
(30, 24, '2022-05-24', '2022-09-25'),
(31, 10, '2022-05-24', '2022-09-25');

CREATE TABLE `ProductImage` (
    `idProduct` INT NOT NULL,
    `additionalImage` VARCHAR(256) NOT NULL,
    FOREIGN KEY (`idProduct`) REFERENCES `Product`(`id`) ON DELETE CASCADE
);


CREATE TABLE `CommentRating`(
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `idAccount` INT NOT NULL,
    `idProduct` INT NOT NULL,
    `commentContent` VARCHAR(1024) NOT NULL,
    `ratingPoint` INT NOT NULL,
    `commentDate` DATETIME NOT NULL DEFAULT NOW(),
    FOREIGN KEY (`idAccount`) REFERENCES `Account`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`idProduct`) REFERENCES `Product`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
INSERT INTO `CommentRating`(`idAccount`, `idProduct`, `commentContent`, `ratingPoint`) VALUES
(2, 1, 'Sản phẩm khá tốt trong tầm giá', '4'),
(3, 1, 'Sản phẩm mới lạ, độc đáo từ thiết kế đến tính năng. Chất lượng bền đẹp, tiện dụng, dễ dàng lắp ráp nhưng lại rất chắc chắn. Giao hàng nhanh chóng vừa mới đặt 3 ngày trước là đã có hàng', '5');


CREATE TABLE `Order`(
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `idAccount` INT NOT NULL,
    `note` VARCHAR(1024) DEFAULT NULL,
    `shippingAddress` VARCHAR(1024) NOT NULL,
    `status` VARCHAR(64) NOT NULL DEFAULT 'Chờ duyệt',
    `totalPrice` INT NOT NULL,
    `shippingFee` INT NOT NULL DEFAULT 0,
    `orderDate` DATETIME NOT NULL DEFAULT NOW(),
    `statusChangeDate` DATETIME NOT NULL DEFAULT NOW(),
    FOREIGN KEY (`idAccount`) REFERENCES `Account`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
INSERT INTO `Order`(`idAccount`, `note`, `shippingAddress`, `status`, `totalPrice`, `shippingFee`, `orderDate`, `statusChangeDate`) VALUES
(2, 'Giao vào các ngày 2 4 6', '10 Bát Đàn, Quận Hoàn Kiếm, Hà Nội', 'Giao thành công', 9000000, 50000, '2022-02-06 15:32:40', '2022-02-07 15:32:40'),
(3, 'Giao vào các ngày 3 5 7', '632 Lê Văn Lương, Quận 7, TPHCM', 'Giao thành công', 9000000, 250000, '2022-02-06 15:32:41', '2022-02-07 15:32:41'),
(3, 'Giao vào các ngày 3 5 7', '632 Lê Văn Lương, Quận 7, TPHCM', 'Chờ duyệt', 22170000, 0, '2022-02-07 15:32:41', '2022-02-07 15:32:41');


CREATE TABLE `OrderProduct`(
    `idOrder` INT NOT NULL,
    `idProduct` INT NOT NULL,
    `productPrice` INT NOT NULL,
    `quantityProduct` INT NOT NULL,
    FOREIGN KEY (`idOrder`) REFERENCES `Order`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`idProduct`) REFERENCES `Product`(`id`) ON DELETE CASCADE
);
INSERT INTO `OrderProduct`(`idOrder`, `idProduct`, `productPrice`, `quantityProduct`) VALUES
(1, 1, 9000000, 1),
(2, 1, 9000000, 1),
(3, 2, 7390000, 3);


CREATE TABLE `Post`(
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `title` VARCHAR(256) DEFAULT NULL,
    `tag` VARCHAR(64) DEFAULT NULL,
    `postImage` VARCHAR(256) NOT NULL,
    `description` VARCHAR(1024) DEFAULT NULL,
    `content` TEXT DEFAULT NULL,
    `idAuthor` INT NOT NULL,
    `view` INT NOT NULL DEFAULT 0,
    `addDate` DATETIME NOT NULL DEFAULT NOW(),
    FOREIGN KEY (`idAuthor`) REFERENCES `Account`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
INSERT INTO `Post`(`title`, `tag`, `postImage`, `description`, `content`, `idAuthor`) VALUES 
('3 vấn đề thường gặp với máy lạnh và cách khắc phục', 'Blog nội thất', '3-van-de-thuong-gap-voi-may-lanh-va-cach-khac-phuc-1.jpg', 
'Phòng khách là một trong những không gian được sử dụng nhiều nhất và đa chức năng nhất. Việc bố trí phòng khách đẹp rất đa dạng, nhưng nó phụ thuộc vào cách bạn sử dụng như thế nào. Đầu tiên, khi quyết định bố trí phòng khách của mình, bạn cần xác định mục đích của nó. Bạn có cần nhiều chỗ ngồi hay chỉ cần một chiếc sofa là đủ? Đó sẽ là một không gian đa chức năng, để thư giãn, để giải trí, làm việc, đọc sách, lưu trữ? Không gian nên giản dị, sang trọng hay bao gồm cả hai?', 
'<p>Khi bạn đ&atilde; x&aacute;c định r&otilde; nhu cầu, bạn sẽ quyết định ch&iacute;nh x&aacute;c &ldquo;cấu h&igrave;nh&rdquo; cho kh&ocirc;ng gian. Bởi trong c&aacute;ch bố tr&iacute; nội thất ph&ograve;ng kh&aacute;ch n&oacute;i ri&ecirc;ng v&agrave; tất cả kh&ocirc;ng gian n&oacute;i chung, đều c&oacute; những nguy&ecirc;n tắc, trong đ&oacute; c&oacute; nguy&ecirc;n tắc thị gi&aacute;c. V&iacute; dụ,như bố tr&iacute; c&acirc;n bằng, nhấn mạnh, nhịp điệu, đối xứng, bất đối xứng, v.v&hellip;</p>

<p>Ngo&agrave;i ra, t&iacute;nh chất của kh&ocirc;ng gian l&agrave; ấm c&uacute;ng, th&acirc;n mật, trang nghi&ecirc;m, đối thoại, hay tương t&aacute;c, v.v&hellip;Tất cả đều quyết định đến c&aacute;ch m&agrave; bạn sẽ bố tr&iacute; ph&ograve;ng kh&aacute;ch.</p>

<p>Dưới đ&acirc;y l&agrave; 8 &yacute; tưởng sắp xếp v&agrave; bố tr&iacute; nội thất ph&ograve;ng kh&aacute;ch đẹp để bạn tham khảo trước khi l&agrave;m nh&agrave;:</p>

<p style="text-align:center"><a href="https://thietkenoithatblog.com/wp-content/uploads/2021/09/cach-ke-sofa-phong-khach-dep-cho-nha-pho.jpg"><img alt="cach bo tri phong khach dep cho nha pho" src="https://thietkenoithatblog.com/wp-content/uploads/2021/09/cach-ke-sofa-phong-khach-dep-cho-nha-pho.jpg" style="height:1240px; width:728px" /></a></p>

<h3><strong>Bố tr&iacute; ph&ograve;ng kh&aacute;ch # 1: h&igrave;nh chữ U</strong></h3>

<p>Với bố cục sắp xếp h&igrave;nh chữ U c&oacute; thể d&ugrave;ng hai ghế sofa song song, v&agrave; hai ghế armchair ở b&ecirc;n cạnh. Hoặc d&ugrave;ng kiểu sofa chữ U.&nbsp;Việc bố tr&iacute;&nbsp;<a href="https://www.ekeinterior.com/xu-huong-thiet-ke-noi-that-phong-khach-dep-2020.html" rel="noopener" target="_blank">sofa ph&ograve;ng kh&aacute;ch</a>&nbsp;h&igrave;nh chữ U chỉ ph&ugrave; hợp trong c&aacute;c ph&ograve;ng kh&aacute;ch lớn, nơi c&oacute; thể chứa nhiều đồ đạc v&agrave; c&oacute; lối giao th&ocirc;ng rộng r&atilde;i. Kiểu bố tr&iacute; n&agrave;y dễ thấy ở c&aacute;c nh&agrave; biệt thự hơn l&agrave; nh&agrave; phố hay căn hộ chung cư.</p>

<p style="text-align:center"><a href="https://thietkenoithatblog.com/wp-content/uploads/2021/09/mat-bang-bo-tri-noi-that-phong-khach-chu-U.jpg"><img alt="bo tri noi that phong khach chu U" src="https://thietkenoithatblog.com/wp-content/uploads/2021/09/mat-bang-bo-tri-noi-that-phong-khach-chu-U.jpg" style="height:600px; width:1080px" /></a></p>

<p>Ph&ograve;ng kh&aacute;ch, nếu&nbsp;<a href="https://thietkenoithatblog.com/ghe-sofa-nao-phu-hop-voi-phong-khach-nha-ban.html">bố tr&iacute; sofa</a>&nbsp;h&igrave;nh chữ U, bạn phải lu&ocirc;n lưu &yacute; đến t&acirc;m điểm của ch&uacute;ng l&agrave; g&igrave;. T&acirc;m điểm của sofa c&oacute; thể l&agrave; view nh&igrave;n đẹp, tủ tv, hoặc m&agrave;n h&igrave;nh chiếu phim lớn. Đối với thiết kế kiểu cổ điển Ch&acirc;u &Acirc;u th&igrave; t&acirc;m điểm của ph&ograve;ng kh&aacute;ch thường l&agrave; l&ograve; sưởi.</p>

<p style="text-align:center"><a href="https://thietkenoithatblog.com/wp-content/uploads/2021/09/bo-tri-sofa-phong-khach-chu-u.jpg"><img alt="bo tri sofa phong khach chu u" src="https://thietkenoithatblog.com/wp-content/uploads/2021/09/bo-tri-sofa-phong-khach-chu-u.jpg" style="height:700px; width:1080px" /></a></p>

<p>Cấu h&igrave;nh ph&ograve;ng kh&aacute;ch h&igrave;nh chữ U v&ocirc; h&igrave;nh dung đ&atilde; tạo ra một sự ph&acirc;n chia khu vực rất r&otilde; r&agrave;ng. C&aacute;ch bố tr&iacute; n&agrave;y khuyến kh&iacute;ch v&agrave; th&uacute;c đ&acirc;y sự tương t&aacute;c &amp; tr&ograve; chuyện giữa c&aacute;c th&agrave;nh vi&ecirc;n trong gia đ&igrave;nh hơn, đồng thời c&oacute; nhiều chỗ ngồi v&agrave; l&agrave; một trong những c&aacute;ch sắp xếp chỗ ngồi thoải m&aacute;i nhất.</p>

<h3><strong>Bố tr&iacute; ph&ograve;ng kh&aacute;ch # 2: đối xứng v&agrave; song song</strong></h3>

<p>&nbsp;Trong nghệ thuật&nbsp;<a href="https://thietkenoithatblog.com/thiet-ke-chung-cu-safira-khang-dien-3-phong-ngu-85m2.html">thiết kế nội thất</a>&nbsp;v&agrave; kiến ​​tr&uacute;c, t&iacute;nh đối xứng từ l&acirc;u được coi l&agrave; sự h&agrave;i h&ograve;a bởi vẻ đẹp v&agrave; sự c&acirc;n bằng của n&oacute;. C&aacute;ch sắp xếp đồ nội thất song song đối xứng, l&agrave; sự phản chiếu ho&agrave;n hảo. Hai ghế sofa đối diện nhau, được kết nối bởi b&agrave;n tr&agrave;, l&agrave; cấu h&igrave;nh phổ biến nhất. Mặc d&ugrave; c&oacute; thể c&ugrave;ng một &yacute; tưởng đ&oacute; nhưng c&oacute; thể bố tr&iacute; ph&ograve;ng kh&aacute;ch theo kiểu kh&aacute;c.</p>

<p style="text-align:center"><a href="https://thietkenoithatblog.com/wp-content/uploads/2021/09/sap-xep-sofa-phong-khach-kieu-song-song.jpg"><img alt="bo tri phong khach doi xung song song" src="https://thietkenoithatblog.com/wp-content/uploads/2021/09/sap-xep-sofa-phong-khach-kieu-song-song.jpg" style="height:700px; width:1080px" /></a></p>

<p>H&igrave;nh thức đối xứng của việc bố tr&iacute; n&agrave;y rất ph&ugrave; hợp với c&aacute;c thiết kế nội thất cổ điển hoặc t&acirc;n cổ điển. V&agrave; đặc điểm kiến ​​tr&uacute;c cổ điển cũng c&oacute; t&iacute;nh chất đối xứng tương tự như trong bố tr&iacute; nội thất.</p>

<p>Giống như kiểu sắp xếp h&igrave;nh chữ U, lối bố tr&iacute; n&agrave;y cũng c&oacute; ti&ecirc;u điểm (tủ TV, l&ograve; sưởi&hellip;) Nhưng kh&aacute;c ở chổ, c&aacute;ch bố tr&iacute; đối xứng song song nhấn mạnh sự tương t&aacute;c trực tiếp, trực diện v&agrave; mang t&iacute;nh trang nghi&ecirc;m hơn.</p>

<h3><strong>Bố tr&iacute; ph&ograve;ng kh&aacute;ch # 3: kh&ocirc;ng đối xứng v&agrave; song song</strong></h3>

<p>Một ph&ograve;ng kh&aacute;ch được bố tr&iacute; theo kiểu song song kh&ocirc;ng đối xứng c&oacute; đặc điểm tương tự với bố tr&iacute; đối xứng. Nghĩa l&agrave; cũng ngồi đối diện, song song, kết nối bởi b&agrave;n sofa. Sự kh&aacute;c biệt nằm ở chỗ ngồi. Một sofa d&agrave;i, đối diện l&agrave; hai sofa đơn, hoặc hai ghế armchair.</p>

<p style="text-align:center"><a href="https://thietkenoithatblog.com/wp-content/uploads/2021/09/8-y-tuong-bo-tri-phong-khach-don-gian-vua-dep-vua-sang.jpg"><img alt="cach bo tri sofa phong khach vua dep vua sang" src="https://thietkenoithatblog.com/wp-content/uploads/2021/09/8-y-tuong-bo-tri-phong-khach-don-gian-vua-dep-vua-sang.jpg" style="height:700px; width:1079px" /></a></p>

<p>Lối bố tr&iacute; sofa n&agrave;y &aacute;p dụng trong trường hợp kh&ocirc;ng gian c&oacute; diện t&iacute;ch kh&ocirc;ng qu&aacute; rộng, v&agrave; lối giao th&ocirc;ng bị hạn chế về diện t&iacute;ch. Do đ&oacute;, mục đ&iacute;ch của việc sử dụng hai ghế sofa đơn l&agrave; để thuận tiện việc ra v&agrave;o dễ d&agrave;ng.&nbsp;Ưu điểm của c&aacute;ch bố tr&iacute; n&agrave;y l&agrave; đảm bảo chổ ngồi ph&ugrave; hợp, lưu th&ocirc;ng dễ d&agrave;ng, sự ri&ecirc;ng tư cần thiết v&agrave; di chuyển linh hoạt.</p>

<h3><strong>Bố tr&iacute; ph&ograve;ng kh&aacute;ch # 4: h&igrave;nh chữ L</strong></h3>

<p>Sắp xếp ph&ograve;ng kh&aacute;ch h&igrave;nh chữ L được thiết lập bằng c&aacute;ch đặt ghế phụ vu&ocirc;ng g&oacute;c với sofa ch&iacute;nh. Hoặc sofa h&igrave;nh L. T&acirc;m điểm của sofa thường l&agrave; tủ TV. C&aacute;ch n&agrave;y kh&aacute; phố biến đối với nh&agrave; phố v&agrave; căn hộ chung cư, hoặc ph&ograve;ng c&oacute; diện t&iacute;ch nhỏ.</p>

<p style="text-align:center"><a href="https://thietkenoithatblog.com/wp-content/uploads/2021/09/8-y-tuong-bo-tri-phong-khach-don-gian-vua-dep-vua-sang-ekeinterior.jpg"><img alt="8 y tuong bo tri phong khach don gian vua dep vua sang-eke" src="https://thietkenoithatblog.com/wp-content/uploads/2021/09/8-y-tuong-bo-tri-phong-khach-don-gian-vua-dep-vua-sang-ekeinterior.jpg" style="height:700px; width:1080px" /></a></p>

<p>Bố tr&iacute; sofa ph&ograve;ng kh&aacute;ch chữ L</p>

<p>C&aacute;ch bố tr&iacute; sofa chữ L tối ưu về diện t&iacute;ch, th&iacute;ch hợp cho nh&agrave; c&oacute; người gi&agrave; trẻ em, v&agrave; tất nhi&ecirc;n cũng kh&ocirc;ng k&eacute;m phần ấm c&uacute;ng. Ngo&agrave;i ra g&oacute;c sofa chữ L mang lại sự thoải m&aacute;i, th&iacute;ch hợp để ng&atilde; lưng, thư gi&atilde;n, đọc s&aacute;ch, v.v&hellip;</p>

<h3><strong>Sắp xếp ph&ograve;ng kh&aacute;ch # 5: h&igrave;nh hộp</strong></h3>

<p>Đối với c&aacute;ch bố tr&iacute; b&agrave;n ghế sofa ph&ograve;ng kh&aacute;ch dạng h&igrave;nh hộp, đ&ograve;i hỏi diện t&iacute;ch ph&ograve;ng kh&aacute;ch phải lớn, c&aacute;c lối lưu th&ocirc;ng rộng r&atilde;i. Lối di ra v&agrave;o giữa c&aacute;c ghế armchair v&agrave; sofa phải linh hoạt. Điểm kết nối, đồng thời l&agrave; t&acirc;m điểm của c&aacute;ch bố tr&iacute; n&agrave;y l&agrave; b&agrave;n tr&agrave; phải c&oacute; tỷ lệ c&acirc;n đối. Qu&aacute; to hoặc qu&aacute; nhỏ sẽ mất c&acirc;n đối, l&agrave;m cho ph&ograve;ng kh&aacute;ch trở n&ecirc;n k&eacute;m sang.</p>

<p style="text-align:center"><a href="https://thietkenoithatblog.com/wp-content/uploads/2021/09/bo-tri-phong-khach-hinh-vuong.jpg"><img alt="cach bo tri phong khach sofa hinh vuong" src="https://thietkenoithatblog.com/wp-content/uploads/2021/09/bo-tri-phong-khach-hinh-vuong.jpg" style="height:700px; width:1080px" title="bo tri phong khach sofa hinh vuong" /></a></p>

<p>Bố cục ph&ograve;ng kh&aacute;ch h&igrave;nh hộp l&yacute; tưởng cho những căn ph&ograve;ng kh&ocirc;ng c&oacute; điểm nhấn. Mục đ&iacute;ch của kh&ocirc;ng gian n&agrave;y l&agrave; hướng cuộc tr&ograve; chuyện v&agrave;o b&ecirc;n trong. Mang đến sự tập trung khi một kh&ocirc;ng gian qu&aacute; rộng r&atilde;i. Sự sắp xếp n&agrave;y cũng rất tuyệt vời cho những buổi họp mặt gia đ&igrave;nh.</p>

<p style="text-align:center"><a href="https://thietkenoithatblog.com/wp-content/uploads/2021/09/ke-ghe-sofa-hinh-vuong-trong-phong-khach-rat-dep.jpg"><img alt="ke ghe sofa hinh vuong trong phong khach rat dep" src="https://thietkenoithatblog.com/wp-content/uploads/2021/09/ke-ghe-sofa-hinh-vuong-trong-phong-khach-rat-dep.jpg" style="height:900px; width:1080px" title="ke ghe sofa phong khach hinh vuong" /></a></p>

<p>&nbsp;</p>

<h3><strong>Sắp xếp ph&ograve;ng kh&aacute;ch # 6: h&igrave;nh tr&ograve;n</strong></h3>

<p>Đặc trưng bởi sự sắp xếp c&aacute;c ghế đơn xung quanh b&agrave;n tr&agrave; tr&ograve;n. Ghế sofa cong l&agrave; một sự thay thế hợp l&yacute; cho c&aacute;ch bố tr&iacute; ph&ograve;ng kh&aacute;ch h&igrave;nh tr&ograve;n. Để bố cục chặt chẽ hơn, giải ph&aacute;p thảm s&agrave;n l&agrave; kh&ocirc;ng phải b&agrave;n c&atilde;i.</p>

<p style="text-align:center"><a href="https://thietkenoithatblog.com/wp-content/uploads/2021/09/bo-tri-sofa-hinh-tron-cho-phong-khach.jpg"><img alt="bo tri sofa hinh tron cho phong khach" src="https://thietkenoithatblog.com/wp-content/uploads/2021/09/bo-tri-sofa-hinh-tron-cho-phong-khach.jpg" style="height:720px; width:1080px" /></a></p>

<p>Ưu điểm của cấu h&igrave;nh tr&ograve;n l&agrave; kh&ocirc;ng cần ti&ecirc;u điểm, v&agrave; c&oacute; thể ho&aacute;n đổi linh hoạt ở bất kỳ vị tr&iacute; n&agrave;o trong kh&ocirc;ng gian. Ngo&agrave;i ra c&ograve;n đảm bảo sự ri&ecirc;ng tư của từng c&aacute; nh&acirc;n, trong khi vẫn th&uacute;c đẩy sự tương t&aacute;c trực tiếp v&agrave; th&acirc;n mật.</p>

<p style="text-align:center"><a href="https://thietkenoithatblog.com/wp-content/uploads/2021/09/ke-sofa-phong-khach-nha-hinh-tron.jpg"><img alt="ke sofa phong khach nha hinh tron " src="https://thietkenoithatblog.com/wp-content/uploads/2021/09/ke-sofa-phong-khach-nha-hinh-tron.jpg" style="height:800px; width:1080px" /></a></p>

<p>Nhược điểm của việc bố tr&iacute; ph&ograve;ng kh&aacute;ch h&igrave;nh tr&ograve;n l&agrave; ph&ograve;ng kh&aacute;ch phải c&oacute; diện t&iacute;ch lớn. Cho n&ecirc;n ch&uacute;ng thường kh&ocirc;ng th&iacute;ch hợp để bố tr&iacute; ở vị tr&iacute; trung t&acirc;m của ph&ograve;ng kh&aacute;ch. Hay n&oacute;i c&aacute;ch kh&aacute;c, chức năng l&agrave; khu vực tiếp kh&aacute;ch phụ c&oacute; vẻ ph&ugrave; hợp hơn.</p>

<h3><strong>Sắp xếp ph&ograve;ng kh&aacute;ch # 7: sắp xếp chỗ ngồi đ&ocirc;i</strong></h3>

<p>C&aacute;c khu vực tiếp kh&aacute;ch ri&ecirc;ng biệt n&agrave;y kh&ocirc;ng nhất thiết phải giống nhau về kiểu d&aacute;ng, k&iacute;ch thước hoặc mục đ&iacute;ch. Tr&ecirc;n thực tế, ch&uacute;ng c&oacute; thể l&agrave; một c&aacute;ch tốt để tạo ra sự kh&aacute;c biệt trong một ph&ograve;ng kh&aacute;ch lớn.</p>

<p>Hai đ&egrave;n chiếu s&aacute;ng, hoặc một tủ s&aacute;ch cao giữa hai sofa sẽ mang lại sự ri&ecirc;ng tư cho mỗi kh&ocirc;ng gian. Nếu bạn muốn duy tr&igrave; cảm gi&aacute;c h&ograve;a hợp trong căn ph&ograve;ng, h&atilde;y chọn một phần ngăn c&aacute;ch thấp hơn, v&iacute; dụ như lưng ghế thấp hoặc b&agrave;n, kệ console.</p>

<p style="text-align:center"><a href="https://thietkenoithatblog.com/wp-content/uploads/2021/09/bo-tri-cho-ngoi-doi-trong-phong-khach-biet-thu.jpg"><img alt="bo tri cho ngoi doi trong phong khach biet thu" src="https://thietkenoithatblog.com/wp-content/uploads/2021/09/bo-tri-cho-ngoi-doi-trong-phong-khach-biet-thu.jpg" style="height:721px; width:1080px" /></a></p>

<p>C&aacute;ch sắp xếp kiểu n&agrave;y cho ph&eacute;p lựa chọn vị tr&iacute; ngồi th&iacute;ch hợp. Trọng t&acirc;m của mỗi v&ugrave;ng sẽ được nhấn mạnh bằng đ&egrave;n ch&ugrave;m sang trọng. Ti&ecirc;u điểm của cấu h&igrave;nh n&agrave;y sẽ được ph&acirc;n bổ dọc hai b&ecirc;n lối đi.&nbsp;Lối bố tr&iacute; ph&ograve;ng kh&aacute;ch theo c&aacute;ch n&agrave;y th&iacute;ch hợp cho những dinh thự, nơi m&agrave; phong kh&aacute;ch l&agrave; những đại sảnh lớn.</p>

<h3>Sắp xếp ph&ograve;ng kh&aacute;ch # 8: ph&ograve;ng kh&aacute;ch th&ocirc;ng với ph&ograve;ng ăn</h3>

<p>Giải ph&aacute;p n&agrave;y thường được &aacute;p dụng cho ph&ograve;ng kh&aacute;ch c&oacute; h&igrave;nh chữ nhật. Bố tr&iacute;&nbsp;<a href="https://www.ekeinterior.com/bi-quyet-trang-tri-phong-khach-dep-cho-nha-o.html" rel="noopener" target="_blank">ph&ograve;ng kh&aacute;ch</a>&nbsp;th&ocirc;ng với ph&ograve;ng ăn được sử hầu hết trong c&aacute;c căn hộ chung cư cho đến phố, cũng như c&aacute;c biệt thự lớn.</p>

<p style="text-align:center"><a href="https://thietkenoithatblog.com/wp-content/uploads/2021/09/mat-bang-bo-tri-phong-khach-thong-voi-phong-an.jpg"><img alt="mat bang bo tri phong khach thong voi phong an" src="https://thietkenoithatblog.com/wp-content/uploads/2021/09/mat-bang-bo-tri-phong-khach-thong-voi-phong-an.jpg" style="height:700px; width:1024px" /></a></p>

<p>Sự sắp xếp hai trong một n&agrave;y mang lại kh&ocirc;ng kh&iacute; gia đ&igrave;nh gần gũi v&agrave; th&acirc;n mật v&ocirc; tận, bởi n&oacute; khuyến kh&iacute;ch những cuộc tr&ograve; chuyện giữa c&aacute;c th&agrave;nh vi&ecirc;n sau bữa tối.</p>

<p style="text-align:center"><a href="https://thietkenoithatblog.com/wp-content/uploads/2021/09/y-tuong-bo-tri-phong-khach-thong-voi-phong-an.jpg"><img alt="sap xep phong khach ke phong an" src="https://thietkenoithatblog.com/wp-content/uploads/2021/09/y-tuong-bo-tri-phong-khach-thong-voi-phong-an.jpg" style="height:944px; width:927px" /></a></p>

<p>Với&nbsp;<strong>8</strong>&nbsp;<strong>&yacute; tưởng bố tr&iacute; nội thất ph&ograve;ng kh&aacute;ch</strong>&nbsp;ch&uacute;ng t&ocirc;i vừa gợi &yacute;, hy vọng sẽ mang tới niềm cảm hứng cho bạn trong việc quyết định chọn phương &aacute;n bố tr&iacute; ph&ugrave; hợp cho ph&ograve;ng kh&aacute;ch th&ecirc;m đẹp v&agrave; sang trọng hơn.</p>', 1),

('Cách chọn bàn ăn tốt nhất cho không gian nội thất của bạn', 'Blog nội thất', 'cach-chon-ban-an-tot-nhat-cho-khong-gian-noi-that-cua-ban-3-585x390.jpg', 
'Việc chọn một cái bàn ăn mới có thể thú vị, và nó cho phép xác định phong cách bạn muốn cho phòng ăn của mình. Và có nhiều lựa chọn hấp dẫn để sắp xếp. Ai cũng thích một món đồ nội thất mới sành điệu? Nhưng việc chọn bàn ăn phải được thực hiện một cách cẩn thận vì chiếc bàn là một món nội thất cố định lớn trong phòng. Vì vậy, dưới đây chúng tôi sẽ đề cập đến cách chọn bàn ăn phù hợp cho ngôi nhà của bạn.', 
'<p>Mua sắm cho một b&agrave;n ăn c&oacute; thể mất một ng&agrave;y hoặc v&agrave;i tuần, t&ugrave;y thuộc v&agrave;o thời gian bạn t&ugrave;y chọn bạn chọn để sắp xếp. Đ&ocirc;i khi bạn t&igrave;m thấy đ&uacute;ng mẫu ngay lập tức, v&agrave; đ&ocirc;i khi phải mất một khoảng thời gian d&agrave;i. B&agrave;n ăn cũng thay đổi tr&ecirc;n tất cả c&aacute;c phạm vi gi&aacute;, t&ugrave;y thuộc v&agrave;o k&iacute;ch thước, vật liệu v&agrave; phong c&aacute;ch. Tuy nhi&ecirc;n cần một số mẹo để gi&uacute;p bạn quyết định loại b&agrave;n ăn bạn muốn.&nbsp;Bạn c&oacute; thể giảm thời gian t&igrave;m kiếm nếu bạn biết loại b&agrave;n n&agrave;o sẽ ph&ugrave; hợp nhất với nhu cầu v&agrave; kh&ocirc;ng gian của m&igrave;nh.</p>

<p><img alt="cách chọn bàn ăn tốt nhất" src="https://thietkenoithatblog.com/wp-content/uploads/2019/07/cach-chon-ban-an-tot-nhat-cho-khong-gian-noi-that-cua-ban-1.png" style="height:566px; width:800px" /></p>

<h3>Lấy k&iacute;ch thước ph&ograve;ng ăn</h3>

<p>C&aacute;c t&iacute;nh năng x&aacute;c định nhất của b&agrave;n ăn l&agrave; k&iacute;ch thước của n&oacute;.&nbsp;Một số gia chủ y&ecirc;u cầu sự mở rộng, một số người lại th&iacute;ch nhỏ&nbsp;v&agrave; tối giản.&nbsp;Tất nhi&ecirc;n k&iacute;ch thước ph&ograve;ng ăn của bạn sẽ l&agrave; một yếu tố lớn trong việc đưa ra lựa chọn k&iacute;ch thước b&agrave;n. V&igrave; vậy, bắt đầu bằng c&aacute;ch đo kh&ocirc;ng gian m&agrave; bạn dự định đặt b&agrave;n ăn.</p>

<p>Nếu bạn muốn c&oacute; nhiều kh&ocirc;ng gian cho việc lưu th&ocirc;ng dễ d&agrave;ng hơn h&atilde;y chọn h&igrave;nh dạng b&agrave;n ăn ph&ugrave; hợp với&nbsp;<a href="https://thietkenoithatblog.com/">thiết kế</a>&nbsp;ph&ograve;ng, phổ biến c&oacute; thể l&agrave; b&agrave;n ăn tr&ograve;n hoặc b&agrave;n vu&ocirc;ng. Với những ph&ograve;ng ăn nhỏ bạn n&ecirc;n ưu ti&ecirc;n cho việc sử dụng b&agrave;n ăn th&ocirc;ng minh như: b&agrave;n gấp gọn hoặc b&agrave;n gắn tường để gi&uacute;p tiết kiệm diện t&iacute;ch s&agrave;n, cho kh&ocirc;ng gian th&ecirc;m tho&aacute;ng đ&atilde;ng.</p>

<p><img alt="cách lựa chọn bàn cho phòng ăn " src="https://thietkenoithatblog.com/wp-content/uploads/2019/07/cach-chon-ban-an-tot-nhat-cho-khong-gian-noi-that-cua-ban-4.jpg" style="height:532px; width:800px" /></p>

<p>Lưu &yacute; những kh&ocirc;ng gian mở th&igrave; thường kh&ocirc;ng c&oacute; kh&ocirc;ng gian b&agrave;n ăn.&nbsp;Thay v&agrave;o đ&oacute;, bạn c&oacute; thể tạo ra một kh&ocirc;ng gian ăn uống bất cứ nơi n&agrave;o bạn đặt b&agrave;n. C&aacute;c yếu tố trực quan như tấm thảm s&agrave;n c&oacute; thể tạo ra một số tổ chức trong kh&ocirc;ng gian, đồng thời kh&ocirc;ng &aacute;p đảo hoặc lấn &aacute;t kh&ocirc;ng gian mở.</p>

<p><img alt="cách chọn cho phòng ăn " src="https://thietkenoithatblog.com/wp-content/uploads/2019/07/cach-chon-ban-an-tot-nhat-cho-khong-gian-noi-that-cua-ban-2.jpg" style="height:522px; width:800px" /></p>

<h3>Chọn một phong c&aacute;ch v&agrave; vật liệu cho b&agrave;n ăn</h3>

<p>Bước tiếp theo của bạn l&agrave; chọn phong c&aacute;ch bạn muốn cho một b&agrave;n ăn. Một v&agrave;i v&iacute; dụ bao gồm:</p>

<ul>
	<li>Những ng&ocirc;i nh&agrave; cổ điển hoạt tốt với kết cấu gỗ phong ph&uacute; đậm m&agrave;u.</li>
	<li>Nh&agrave; phong c&aacute;ch hiện đại sẽ kết hợp tốt với những b&agrave;n ăn gỗ c&ocirc;ng nghiệp m&agrave;u trung t&iacute;nh, hay những b&agrave;n ăn mặt đ&aacute;, gương s&aacute;ng b&oacute;ng.</li>
	<li>Phong c&aacute;ch c&ocirc;ng nghiệp l&agrave;m tốt với một b&agrave;n ăn sử dụng c&aacute;c yếu tố kim loại, như ch&acirc;n b&agrave;n bằng th&eacute;p kh&ocirc;ng gỉ.</li>
	<li>Những ng&ocirc;i nh&agrave; y&ecirc;u th&iacute;ch nghệ thuật c&oacute; thể chọn c&aacute;c kiểu d&aacute;ng ngộ nghĩnh, như ch&acirc;n b&agrave;n hướng ra ngo&agrave;i hoặc mặt b&agrave;n c&oacute; h&igrave;nh dạng h&igrave;nh học độc đ&aacute;o.</li>
	<li>Phong c&aacute;ch đồng qu&ecirc; sẽ đi tốt với c&aacute;c mảnh gỗ mộc mạc.</li>
</ul>

<p><img alt="cách lựa chọn cho phòng ăn " src="https://thietkenoithatblog.com/wp-content/uploads/2019/07/cach-chon-ban-an-tot-nhat-cho-khong-gian-noi-that-cua-ban-3.jpg" style="height:715px; width:800px" /></p>

<p>Đ&acirc;y l&agrave; một v&agrave;i &yacute; tưởng gi&uacute;p bạn dễ d&agrave;ng hơn trong việc chọn b&agrave;n ăn. H&atilde;y nhớ rằng, khi t&igrave;m kiếm một m&oacute;n đồ&nbsp;<a href="https://thietkenoithatblog.com/" rel="noopener noreferrer" target="_blank">nội thất</a>&nbsp;lớn hơn, thường đ&oacute; l&agrave; một qu&aacute; tr&igrave;nh y&ecirc;u cầu sự xem x&eacute;t kỹ lưỡng.&nbsp;Giữ phong c&aacute;ch của căn ph&ograve;ng th&ocirc;ng quan b&agrave;n ăn sẽ dễ d&agrave;ng mang đến một mảnh ho&agrave;n hảo cho ng&ocirc;i nh&agrave; của m&igrave;nh.</p>', 1),

('Làm thế nào để biến phòng ngủ thành không gian thư giãn tuyệt vời', 'Blog nội thất', 'lam-the-nao-de-bien-phong-ngu-thanh-khong-gian-thu-gian-tuyet-voi-2-585x390.jpg', 
'Bạn có thấy mình đang vật lộn với sự lo lắng và khó chịu trong phòng ngủ. Thế giới của chúng ta giống như một nơi sinh sản cho sự căng thẳng, nếu bạn không chú ý, thật dễ dàng để bị cuốn theo và cho phép sự lo lắng chiếm lấy cuộc sống của bạn. Một cách để làm chậm mọi thứ và duy trì tầm hồn thư giãn là tạo ra một không gian tôn trọng cảm xúc xa nhân trong chính ngôi nhà của mình. Đối với hầu hết mọi người, đó là phòng ngủ, bởi đây là một không gian tự nhiên gắn liền với sự thư giãn trong hầu hết một ngày, vì vậy cần sự đầu tư phù hợp và hoàn hảo nhất.', 
'<p>Dưới đ&acirc;y l&agrave; một v&agrave;i lời khuy&ecirc;n để gi&uacute;p cho việc&nbsp;<a href="https://thietkenoithatblog.com/">thiết kế</a>&nbsp;ph&ograve;ng ngủ của bạn trở th&agrave;nh một nơi thư gi&atilde;n đ&aacute;ng tận hưởng.</p>

<h3>Bỏ tivi ra khỏi ph&ograve;ng ngủ</h3>

<p>Nếu bạn c&oacute; một chiếc tivi trong ph&ograve;ng ngủ th&igrave; chỉ cần nghĩ về bao nhi&ecirc;u thứ ti&ecirc;u cực đến từ truyền h&igrave;nh th&igrave; đ&atilde; ph&aacute; vỡ ho&agrave;n to&agrave;n ph&ograve;ng ngủ của bạn. C&oacute; những tin tức, c&acirc;u chuyện m&agrave; ch&uacute;ng ta thấy hấp dẫn, v&agrave; kh&ocirc;ng c&oacute; g&igrave; sai khi những điều n&agrave;y dừng lại trong chừng mực. Tuy nhi&ecirc;n hầu hết ch&uacute;ng ta bị cuốn qu&aacute; nhiều thời gian v&agrave;o c&ocirc;ng cụ giải tr&iacute; n&agrave;y, đặc biệt với khoảng thời gian trước khi bắt đầu giấc ngủ th&igrave; m&agrave;n h&igrave;nh TV lại mang đến rất nhiều t&aacute;c hại cho sức khỏe. Ch&iacute;nh v&igrave; vậy, bạn sẽ dễ ngủ hơn khi th&aacute;o tivi v&agrave; c&aacute;c c&ocirc;ng nghệ kh&aacute;c ra khỏi ph&ograve;ng. C&aacute;c nghi&ecirc;n cứu đ&atilde; chỉ ra rằng &aacute;nh s&aacute;ng xanh từ c&aacute;c thiết bị n&agrave;y c&oacute; thể cản trở giấc ngủ của bạn.</p>

<h3>D&ugrave;ng một tấm nệm thoải m&aacute;i</h3>

<p><img alt="trang trí phòng ngủ thư giãn" src="https://thietkenoithatblog.com/wp-content/uploads/2019/07/lam-the-nao-de-bien-phong-ngu-thanh-khong-gian-thu-gian-tuyet-voi-4.jpg" style="height:532px; width:800px" /></p>

<p>Nếu đang ngủ tr&ecirc;n một chiếc giường với tuổi thọ đ&atilde; rất l&acirc;u, rất c&oacute; thể sẽ mang lại cảm gi&aacute;c kh&ocirc;ng thoải m&aacute;i cho giấc ngủ của bạn. V&agrave; đ&acirc;y l&agrave; l&yacute; do ch&iacute;nh ph&aacute; hỏng khoảng thời gian nghỉ ngơi thiết yếu nhất trong ng&agrave;y, v&agrave; g&acirc;y n&ecirc;n một ng&agrave;y tồi tệ v&agrave;o h&ocirc;m sau. Một tấm nệm kh&ocirc;ng ph&ugrave; hợp với cơ thể cũng c&oacute; thể khiến bạn kh&ocirc;ng c&oacute; được một đ&ecirc;m nghỉ ngơi trọn vẹn. V&igrave; vậy, nếu bạn kh&ocirc;ng ho&agrave;n to&agrave;n thoải m&aacute;i với chiếc giường của m&igrave;nh, việc t&igrave;m ra chiếc nệm ho&agrave;n hảo sẽ trở th&agrave;nh ưu ti&ecirc;n h&agrave;ng đầu.</p>

<h3>Th&ecirc;m yếu tố thư gi&atilde;n đầu giường</h3>

<p><img alt="trang trí phòng ngủ" src="https://thietkenoithatblog.com/wp-content/uploads/2019/07/lam-the-nao-de-bien-phong-ngu-thanh-khong-gian-thu-gian-tuyet-voi-2.jpg" style="height:533px; width:800px" /></p>

<p>Thay v&igrave; đặt những m&oacute;n đồ&nbsp;<a href="https://thietkenoithatblog.com/kien-thuc-noi-that">nội thất trang tr&iacute;</a>&nbsp;v&ocirc; nghĩa tr&ecirc;n b&agrave;n cạnh giường ngủ, h&atilde;y tạo một cảm gi&aacute;c thư gi&atilde;n ngay tại đ&acirc;y. Đ&acirc;y l&agrave; điểm l&yacute; tưởng cho một bộ khuếch t&aacute;n tinh dầu, nơi bạn c&oacute; thể khuếch t&aacute;n hương thơm thư gi&atilde;n như&nbsp;hoa oải hương&nbsp;v&agrave;&nbsp;hoa c&uacute;c&nbsp;.&nbsp;Giữ cho kh&ocirc;ng gian n&agrave;y kh&ocirc;ng bị lộn xộn, nhưng bạn c&oacute; thể th&ecirc;m bất kỳ vật dụng n&agrave;o mang lại cho bạn cảm gi&aacute;c b&igrave;nh y&ecirc;n, chẳng hạn như&nbsp;h&igrave;nh ảnh của một người th&acirc;n y&ecirc;u.</p>

<h3>Dọn dẹp ph&ograve;ng bừa bộn</h3>

<p><img alt="thiết kế phòng ngủ" src="https://thietkenoithatblog.com/wp-content/uploads/2019/07/lam-the-nao-de-bien-phong-ngu-thanh-khong-gian-thu-gian-tuyet-voi-1.jpg" style="height:600px; width:800px" /></p>

<p>Khi thấy sự bừa bộn v&agrave; lộn xộn trong m&ocirc;i trường xung quanh, n&oacute; c&oacute; thể gợi l&ecirc;n cảm gi&aacute;c lộn xộn v&agrave; bức bối trong t&acirc;m tr&iacute; ch&uacute;ng ta.&nbsp;V&igrave; vậy, h&atilde;y chắc chắn rằng bạn c&oacute; thể dễ d&agrave;ng dọn s&agrave;n nh&agrave; v&agrave; bất kỳ khu vực bề mặt n&agrave;o trong ph&ograve;ng mỗi ng&agrave;y.&nbsp;L&agrave;m cho n&oacute; dễ d&agrave;ng hơn để l&agrave;m bằng c&aacute;ch đặt một c&aacute;i th&ugrave;ng r&aacute;c trong ph&ograve;ng của bạn hay ngay cạnh g&oacute;c cửa h&agrave;nh lang. Bằng c&aacute;ch n&agrave;y, bạn c&oacute; thể qu&eacute;t ph&ograve;ng trong hai ph&uacute;t để loại bỏ bất kỳ đồ vật n&agrave;o kh&ocirc;ng hữu &iacute;ch. Tạo th&oacute;i quen l&agrave;m điều n&agrave;y mỗi s&aacute;ng hoặc buổi tối để đảm bảo kh&ocirc;ng gian lu&ocirc;n ngăn nắp v&agrave; từ đ&oacute; t&acirc;m tr&iacute; sẽ lu&ocirc;n được thoải m&aacute;i.</p>

<p><img alt="thiết kế nội thất phòng ngủ" src="https://thietkenoithatblog.com/wp-content/uploads/2019/07/lam-the-nao-de-bien-phong-ngu-thanh-khong-gian-thu-gian-tuyet-voi-3.jpg" style="height:601px; width:800px" /></p>

<h3>L&agrave;m sạch ra trải giường h&agrave;ng tuần</h3>

<p>Bạn kh&ocirc;ng thể phủ nhận rằng cảm gi&aacute;c thật tuyệt khi nằm xuống một chiếc giường sạch sẽ, tươi mới, đặc biệt l&agrave; với những ng&agrave;y đầy mệt mỏi v&agrave; căng thẳng b&ecirc;n ngo&agrave;i. V&igrave; vậy, h&atilde;y cố gắng tạo th&oacute;i quen loại bỏ bụi bẩn, l&agrave;m sạch khăn trải giường mỗi tuần. Hầu hết mọi người th&iacute;ch tạo th&oacute;i quen n&agrave;y v&agrave; thực hiện v&agrave;o c&ugrave;ng một ng&agrave;y mỗi tuần (thường l&agrave; Chủ nhật để bắt đầu tuần mới).</p>
', 1);

CREATE TABLE `Cart`(
    `idAccount` INT NOT NULL,
	`idProduct` INT NOT NULL,
	`quantityProduct` INT NOT NULL,
	`addDate` DATETIME NOT NULL DEFAULT NOW(),
	FOREIGN KEY (`idAccount`) REFERENCES `Account`(`id`) ON DELETE CASCADE
);
INSERT INTO `Cart`(`idAccount`, `idProduct`, `quantityProduct`) VALUES
(2, 1, 3),
(3, 7, 2),
(3, 2, 2);


