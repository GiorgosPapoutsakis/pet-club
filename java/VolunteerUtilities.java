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

    public void edit(Volunteer newVol) throws Exception {

        DB db = new DB();
        Connection con = null;
        String query = "UPDATE volunteer SET password=?, name=?, surname=?, email=?, phone=?, age=?, location=? WHERE username=?";

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
                stmt.setString(1, newVol.getPassword());
                stmt.setString(2, newVol.getFirstname());
                stmt.setString(3, newVol.getLastname());
                stmt.setString(4, newVol.getEmail());
                stmt.setString(5, newVol.getPhone());
                stmt.setInt(6, newVol.getAge());
                stmt.setString(7, newVol.getLocation());
                stmt.setString(8, newVol.getUsername());
           
            stmt.executeUpdate();

            stmt.close();
            db.close();

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
             db.close();   
            } catch (Exception e) {
                
            }           
            
        }
    
    }


    public void register(Volunteer vol) throws Exception {
        Connection con = null;
        DB db = new DB();
        
        String sql1 = "SELECT * FROM volunteer WHERE username=? OR email=? OR phone = ?";
        
        String sql2 = "INSERT INTO volunteer (username,password,name,surname,email,phone,age,location)" 
        + " VALUES (?, ? ,?, ?, ?, ?, ?, ?);";

        try {
    
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql1);
            stmt.setString(1, vol.getUsername());
			stmt.setString(2, vol.getEmail());
            stmt.setString(3, vol.getPhone());

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                rs.close();
                stmt.close();
                throw new Exception("Το username, email ή τηλέφωνο χρησιμοποιούνται ήδη");
            }


            PreparedStatement stmt2 = con.prepareStatement(sql2);
            stmt2.setString(1, vol.getUsername());
            stmt2.setString(2, vol.getPassword());
            stmt2.setString(3, vol.getFirstname());
            stmt2.setString(4, vol.getLastname());
            stmt2.setString(5, vol.getEmail());
            stmt2.setString(6, vol.getPhone());
            stmt2.setInt(7, vol.getAge());
            stmt2.setString(8, vol.getLocation());

            stmt2.executeUpdate();
            
            stmt2.close();
            rs.close();

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
