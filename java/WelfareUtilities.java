package omadiki_ergasia;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class WelfareUtilities{

    public Welfare authenticate(String username, String password) throws Exception {    
        DB db = new DB();
        Connection con = null;
        String query = "SELECT * FROM welfare WHERE username=? AND password=?;";

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

            Welfare logged_welfare = new Welfare(rs.getString("username"),
                rs.getString("password"), rs.getString("name"),
                rs.getString("owner"), rs.getString("vat"), rs.getString("phone"),
                rs.getString("location"));
            stmt.close();
            con.close();
            return logged_welfare;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {
                
            }
        }
    }

    public List<Welfare> getPageWelfaresByKeyword(String keyword, int limit, int offset) throws Exception{
        //keyword can be name, location, or telephone
        DB db = new DB();
        Connection con = null;
        String query = "SELECT * FROM welfare WHERE name=? OR location=? OR phone=? LIMIT ? OFFSET ?;";

        List<Welfare> found_welfares = new ArrayList<Welfare>();

        //location EDIT for DB standards(No tones and uppercase)
        GreekWord gw = new GreekWord();
        String edited_keyword = gw.removeGreekTones(keyword);
        edited_keyword.toUpperCase();

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            
            stmt.setString(1, keyword);
            stmt.setString(2, edited_keyword);
            stmt.setString(3, keyword);
            stmt.setInt(4, limit);
            stmt.setInt(5, offset);

            ResultSet rs = stmt.executeQuery();
            while( rs.next() ){
                found_welfares.add(new Welfare(rs.getString("username"),rs.getString("password"),
                    rs.getString("name"),rs.getString("owner"),rs.getString("vat"),
                    rs.getString("phone"),rs.getString("location")));
            }

            stmt.close();
            con.close();
            return found_welfares;
                        
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

    public int getCountWelfaresByKeyword(String keyword) throws Exception{
        DB db = new DB();
        Connection con = null;
        String query = "SELECT COUNT(welfID) AS total_welfares FROM welfare WHERE name=? OR location=? OR phone=?;";

        int total_welfares_count = 0;

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);

            stmt.setString(1, keyword);
            stmt.setString(2, keyword);
            stmt.setString(3, keyword);

            ResultSet rs = stmt.executeQuery();
            if( rs.next() ){
                total_welfares_count = rs.getInt("total_welfares");
            }

            stmt.close();
            con.close();
            return total_welfares_count;
                        
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

    public List<Welfare> getPageWelfaresByLocation(String location, int limit, int offset) throws Exception{                
        DB db = new DB();
        Connection con = null;
        String query = "SELECT * FROM welfare WHERE location=? LIMIT ? OFFSET ?;";

        List<Welfare> found_welfares = new ArrayList<Welfare>();

        //No need for location EDIT - taken from DB 
    
        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            
            stmt.setString(1, location);
            stmt.setInt(2, limit);
            stmt.setInt(3, offset);

            ResultSet rs = stmt.executeQuery();
            while( rs.next() ){
                found_welfares.add(new Welfare(rs.getString("username"),rs.getString("password"),
                    rs.getString("name"),rs.getString("owner"),rs.getString("vat"),
                    rs.getString("phone"),rs.getString("location")));
            }

            stmt.close();
            con.close();
            return found_welfares;
                        
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

    public int getCountWelfaresByLocation(String location) throws Exception{
        DB db = new DB();
        Connection con = null;
        String query = "SELECT COUNT(welfID) AS total_welfares FROM welfare WHERE location=?;";

        int total_welfares_count = 0;

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);

            stmt.setString(1, location);

            ResultSet rs = stmt.executeQuery();
            if( rs.next() ){
                total_welfares_count = rs.getInt("total_welfares");
            }

            stmt.close();
            con.close();
            return total_welfares_count;
                        
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
    
    public List<Welfare> getPageAllWelfares(int limit, int offset) throws Exception{
        DB db = new DB();
        Connection con = null;
        String query = "SELECT * FROM welfare LIMIT ? OFFSET ?;";

        List<Welfare> welfares_to_return = new ArrayList<Welfare>();

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            
            stmt.setInt(1, limit);
            stmt.setInt(2, offset);

            ResultSet rs = stmt.executeQuery();
            while( rs.next() ){
                welfares_to_return.add(new Welfare(rs.getString("username"),rs.getString("password"),
                    rs.getString("name"),rs.getString("owner"),rs.getString("vat"),
                    rs.getString("phone"),rs.getString("location")));
            }

            stmt.close();
            con.close();
            return welfares_to_return;
                        
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

    public int getCountAllWelfares() throws Exception{
        DB db = new DB();
        Connection con = null;
        String query = "SELECT COUNT(welfID) AS total_welfares FROM welfare;";

        int total_welfares_count = 0;

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);

            ResultSet rs = stmt.executeQuery();
            if( rs.next() ){
                total_welfares_count = rs.getInt("total_welfares");
            }

            stmt.close();
            con.close();
            return total_welfares_count;
                        
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

    public void saveLastSearch(int volID, List<Welfare> welfares, String keyword) throws Exception {
        //update or save logged user's last searches
							
		DB db = new DB();
		Connection con = null;
		
        String query1 = "SELECT volID, welfID FROM volunteer_welfare WHERE volID = ? and welfID = ?;";
        String query2 = "UPDATE volunteer_welfare SET search_bar = ? WHERE volID = ? and welfID = ?;";
        String query3 = "INSERT INTO volunteer_welfare (volID, welfID, search_bar) VALUES (?,?,?);";

		try {
			con = db.getConnection();
            PreparedStatement stmt1 = con.prepareStatement(query1);
			PreparedStatement stmt2 = con.prepareStatement(query2);
            PreparedStatement stmt3 = con.prepareStatement(query3);
			
            stmt1.setInt(1, volID);
            stmt2.setString(1, keyword);
            stmt2.setInt(2, volID);
            stmt3.setInt(1, volID);
			stmt3.setString(3, keyword);

            for (Welfare welf : welfares){
                int welfID = welf.getPrimaryKey(welf.getUsername(), welf.getPassword());
                stmt1.setInt(2, welfID );
                ResultSet rs;
                rs = stmt1.executeQuery();
                if(rs.next()){
                    stmt2.setInt(3, welfID);
                    stmt2.executeUpdate();                
                }else{
                    stmt3.setInt(2, welfID );
                    stmt3.executeUpdate();
                }
            }

            stmt1.close();
			stmt2.close();
            stmt3.close();
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

}