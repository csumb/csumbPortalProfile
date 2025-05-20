import { LightningElement, wire } from 'lwc';
import getUserProfile from '@salesforce/apex/csumbPortalProfileController.getUserProfile';

export default class CsumbPortalProfile extends LightningElement {
    profile;
    error;

    @wire(getUserProfile)
    wiredProfile({ error, data }) {
        if (data) {
            this.profile = data;
        } else if (error) {
            this.error = error;
            console.error(error);
        }
    }
}
