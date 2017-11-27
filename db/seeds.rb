# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |i|
  Job.create!(
    company_id: 1,
    user_id: 2,
    name: Faker::Job.title,
    content: "
Yêu Cầu Công Việc
- Trình độ Đại học trở lên, chuyên ngành Kinh tế/ Ngoại thương/ QTKD hoặc các ngành liên quan.
- Tối thiếu 03 năm, trong đó có ít nhất 01 năm kinh nghiệm làm trợ lý cho GM người nước ngoài, trợ lý trong lĩnh vực BĐS, nghỉ dưỡng, khách sạn 5 sao.
- Hiểu biết về đầu tư dự án, bất động sản, du lịch nghỉ dưỡng.
- Kín đáo, cẩn trọng và trung thực.
- Có khả năng sử dụng tốt Tiếng Anh (Ilse không thấp hơn 7.0/ Toeic không thấp hơn 800, khác…), khả năng biên phiên dịch, ưu tiên ứng viên đã có kinh nghiệm làm Thư ký/Trợ lý cho CEO là người nước ngoài.
- Có kỹ năng giao tiếp, đàm phán.
- Có khả năng quản lý thời gian tốt, khả năng làm việc độc lập và nhóm tốt.
- Có tinh thần trách nhiệm và khả năng chịu được áp lực công việc.
- Có sức khoẻ đảm bảo công tác; Sẵn sàng đi công tác/điều động khi được yêu cầu.
- Có nguyện vọng làm việc ổn định, lâu dài với các chế độ đãi ngộ hấp dẫn, cạnh tranh.",
    level: "University",
    language: "Vietnamese, Japan",
    skill: Faker::Job.key_skill,
    position: "Manager",
    description: "- Giám sát nhân viên bộ phận sản xuất thực hiện 5S, An toàn lao động trong quá trình sản xuất
- Quản lý tiến độ sản xuất, Quản lý chất lượng , giám sát , xử lý và tổng hợp báo cáo kết quả quá trình sản xuất
- Tổng hợp báo cáo đánh giá định kỳ kỹ năng của nhân viên bộ phận sản xuất
- Thực hiện cải tiến 5S.
- Một số công việc khác theo yêu cầu của cấp trên."
)
end
