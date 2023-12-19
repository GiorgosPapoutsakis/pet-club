package omadiki_ergasia;

import java.sql.*;

public class VolunteerUtilities {

    public Volunteer authenticate(String username, String password) throws Exception {
    
        DB db = new DB();
        Connection con = null;
        String query = "SELECT * FROM volunteer WHERE username=? AND password=?;";

		try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (!rs.next()){
                stmt.close();
                con.close();
                throw new Exception("Wrong username or password");
            }

            Volunteer logged_volunteer = new Volunteer(rs.getString("username"),
                rs.getString("password"),rs.getString("name"),
                rs.getString("surname"),rs.getString("email"),
                rs.getString("phone"),rs.getInt("age"),rs.getString("location"));
            stmt.close();
            con.close();
            return logged_volunteer;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {
                
            }
        }
    }
    
}
