package omadiki_ergasia;

public class ApplicationForm {

    private int formID;
    private String welfareName;
    private String name;
    private String surname;
    private String email;
    private String phone;
    private String location;
    private String address;
    private String job;
    private String exprerience;
    private String moreInfo;
    private int volID;
    private int welfID;
    private boolean isReviewed;
    private boolean result;
    

    public ApplicationForm(int id, String welfareName, String name, String surname, String phone, String email,
     String location, String address, String job, String exprerience, String moreInfo, int volID, int welfID) {
        this.formID = id;
        this.welfareName = welfareName;
        this.name = name;
        this.surname = surname;
        this.phone = phone;
        this.email = email;
        this.location = location;
        this.address = address;
        this.job = job;
        this.exprerience = exprerience;
        this.moreInfo = moreInfo;
        this.volID = volID;
        this.welfID = welfID;
        this.isReviewed = false;
        this.result = false;
    }

    //getters and setters
    public int getFormID() {
        return formID;
    }

    public void setFormID(int formID) {
        this.formID = formID;
    }

    public String getWelfareName() {
        return welfareName;
    }

    public void setWelfareName(String welfareName) {
        this.welfareName = welfareName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getExprerience() {
        return exprerience;
    }

    public void setExprerience(String exprerience) {
        this.exprerience = exprerience;
    }

    public String getMoreInfo() {
        return moreInfo;
    }

    public void setMoreInfo(String moreInfo) {
        this.moreInfo = moreInfo;
    }

    public int getVolID() {
        return volID;
    }

    public void setVolID(int volID) {
        this.volID = volID;
    }

    public int getWelfID() {
        return welfID;
    }

    public void setWelfID(int welfID) {
        this.welfID = welfID;
    }

    public boolean getIsReviewed() {
        return isReviewed;
    }

    public void setIsReviewed(boolean isReviewed) {
        this.isReviewed = isReviewed;
    }

    public boolean getResult() {
        return result;
    }

    public void setResult(boolean result) {
        this.result = result;
    }
    
}