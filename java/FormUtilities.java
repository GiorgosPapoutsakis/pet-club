package omadiki_ergasia;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class FormUtilities {
    
    public void createForm(ApplicationForm form) throws Exception{
							
		DB db = new DB();
		Connection con = null;
		
        String query = "INSERT INTO form (welfare,name,surname,phone,email,location,address,job,experience,more_info,"
        +"isReviewed,result,idvol,idwelfare)  VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?);";

		try {
			con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);

            stmt.setString(1, form.getWelfareName());
            stmt.setString(2, form.getName());
            stmt.setString(3, form.getSurname());
            stmt.setString(4, form.getPhone());
            stmt.setString(5, form.getEmail());
            stmt.setString(6, form.getLocation());
            stmt.setString(7, form.getAddress());
            stmt.setString(8, form.getJob());
            stmt.setString(9, form.getExprerience());
            stmt.setString(10, form.getMoreInfo());
            stmt.setBoolean(11, form.getIsReviewed());
            stmt.setBoolean(12, form.getResult());
            stmt.setInt(13, form.getVolID());
            stmt.setInt(14, form.getWelfID());

            stmt.executeUpdate();
            
            stmt.close();
			con.close();

		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {
			try {
				db.close();
			} catch (Exception e) {
				
			}
		}
    }

    public List<ApplicationForm> getUnreviewedFormsByWelfID(int welfID) throws Exception{

        DB db = new DB();
        Connection con = null;
        String query = "SELECT * FROM form WHERE isReviewed=? AND idwelfare=?;";

        List<ApplicationForm> unreviewed_forms = new ArrayList<ApplicationForm>();

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            
            stmt.setBoolean(1, false);
            stmt.setInt(2, welfID);

            ResultSet rs = stmt.executeQuery();
            while( rs.next() ){
                unreviewed_forms.add(new ApplicationForm(rs.getString("welfare"),
                    rs.getString("name"), rs.getString("surname"),
                    rs.getString("phone"), rs.getString("email"),
                    rs.getString("location"), rs.getString("address"),
                    rs.getString("job"), rs.getString("experience"),
                    rs.getString("more_info"), rs.getInt("idvol"),
                    rs.getInt("idwelfare") ));
            }

            stmt.close();
            con.close();
            return unreviewed_forms;
                        
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {
                // TODO: handle exception
            }
        }
    }


}
