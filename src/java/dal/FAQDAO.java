/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import model.FAQ;

/**
 *
 * @author
 */
public class FAQDAO extends DBContext {

    public Map<String, List<FAQ>> getAllFAQsByType() {
        Map<String, List<FAQ>> faqMap = new HashMap<>();
        String sql = "SELECT faqID, type, question, answer FROM FAQ";

        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                int faqID = rs.getInt("faqID");
                String faqType = rs.getString("type");
                String question = rs.getString("question");
                String answer = rs.getString("answer");

                FAQ faq = new FAQ(faqID, faqType, question, answer);
                if (!faqMap.containsKey(faqType)) {
                    faqMap.put(faqType, new ArrayList<>());
                }
                faqMap.get(faqType).add(faq);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return faqMap;
    }

    public List<FAQ> getAllFAQs() {
        List<FAQ> faqList = new ArrayList<>();
        String sql = "SELECT * FROM FAQ"; // Lấy tất cả thông tin từ bảng FAQ

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int faqID = rs.getInt("faqID");
                String faqType = rs.getString("type");
                String question = rs.getString("question");
                String answer = rs.getString("answer");

                FAQ faq = new FAQ(faqID, faqType, question, answer);
                faqList.add(faq);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return faqList;
    }

    public List<FAQ> searchFAQsByQuestion(String keyword) {
        List<FAQ> faqList = new ArrayList<>();
        String sql = "SELECT * FROM FAQ WHERE question LIKE ?"; // Tìm kiếm theo cột question

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + keyword + "%"); // Sử dụng LIKE để tìm kiếm phần tử chứa keyword
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int faqID = rs.getInt("faqID");
                String faqType = rs.getString("type");
                String question = rs.getString("question");
                String answer = rs.getString("answer");

                FAQ faq = new FAQ(faqID, faqType, question, answer);
                faqList.add(faq);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return faqList;
    }

    public Set<String> getFAQType() {
        Set<String> typeSet = new HashSet<>();
        String sql = "SELECT type FROM FAQ ";

        // Kiểm tra kết nối trước khi thực hiện truy vấn
        if (connection == null) {
            System.err.println("⚠️ Lỗi: Kết nối cơ sở dữ liệu chưa được khởi tạo!");
            return typeSet;
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                String faqType = rs.getString("type");

                typeSet.add(faqType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return typeSet;
    }

    public FAQ getFAQByID(int id) {
        FAQ faq = null;
        String sql = "SELECT * FROM FAQ WHERE faqID = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id); // Thiết lập giá trị cho tham số id

            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                faq = new FAQ();
                faq.setFaqID(rs.getInt("faqID"));
                faq.setType(rs.getString("type"));
                faq.setQuestion(rs.getString("question"));
                faq.setAnswer(rs.getString("answer"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return faq;
    }

    // Add an FAQ
    public void addFAQ(FAQ faqToAdd) {
        String sql = "INSERT INTO [FAQ](type, question, answer) VALUES (?, ?, ?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, faqToAdd.getType());
            st.setString(2, faqToAdd.getQuestion());
            st.setString(3, faqToAdd.getAnswer());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public boolean addFAQBoolean(FAQ faqToAdd) {
        String sql = "INSERT INTO [FAQ](type, question, answer) VALUES (?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, faqToAdd.getType());
            st.setString(2, faqToAdd.getQuestion());
            st.setString(3, faqToAdd.getAnswer());

            int rowsInserted = st.executeUpdate(); // Trả về số dòng bị ảnh hưởng
            return rowsInserted > 0; // Nếu > 0, nghĩa là thêm thành công
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Nếu có lỗi, trả về false
    }

    // Update an FAQ
    public void updateFAQ(FAQ faqToUpdate) {
        String sql = "UPDATE [FAQ] SET type = ?, question = ?, answer = ? WHERE faqID = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, faqToUpdate.getType());
            st.setString(2, faqToUpdate.getQuestion());
            st.setString(3, faqToUpdate.getAnswer());
            st.setInt(4, faqToUpdate.getFaqID()); // Giả sử FAQ có một trường id để xác định
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Update an FAQ
    public boolean updateFAQBoolean(FAQ faqToUpdate) {
        String sql = "UPDATE [FAQ] SET type = ?, question = ?, answer = ? WHERE faqID = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, faqToUpdate.getType());
            st.setString(2, faqToUpdate.getQuestion());
            st.setString(3, faqToUpdate.getAnswer());
            st.setInt(4, faqToUpdate.getFaqID());

            int rowsUpdated = st.executeUpdate(); // Trả về số dòng bị ảnh hưởng
            return rowsUpdated > 0; // Nếu > 0, nghĩa là update thành công
        } catch (SQLException e) {
            System.err.println("Lỗi khi cập nhật FAQ: " + e.getMessage());
        }
        return false;
    }

    public static void main(String[] args) {
        FAQDAO fdao = new FAQDAO();

        FAQ newFAQ = fdao.getFAQByID(23);
        newFAQ.setType("card");
        newFAQ.setQuestion("tôi muốn mua thẻ giá rẻ nhưng sdcadsd");
        newFAQ.setAnswer("không có cái nịt ");

        fdao.updateFAQ(newFAQ);

        System.out.println(newFAQ);
    }

}
