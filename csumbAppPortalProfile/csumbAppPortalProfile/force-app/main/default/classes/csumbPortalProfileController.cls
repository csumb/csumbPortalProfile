public with sharing class csumbPortalProfileController {
    public class ProfileInfo {
        @AuraEnabled public String name;
        @AuraEnabled public String email;
        @AuraEnabled public String phone;
        @AuraEnabled public String photoUrl;
    }

    @AuraEnabled(cacheable=true)
    public static ProfileInfo getUserProfile() {
        User user = [
            SELECT Contact.Name, Contact.Email, Contact.Phone, FullPhotoUrl
            FROM User
            WHERE Id = :UserInfo.getUserId()
            LIMIT 1
        ];

        ProfileInfo info = new ProfileInfo();
        info.name = user.Contact != null ? user.Contact.Name : null;
        info.email = user.Contact != null ? user.Contact.Email : null;
        info.phone = user.Contact != null ? user.Contact.Phone : null;
        info.photoUrl = user.FullPhotoUrl;

        return info;
    }
}
