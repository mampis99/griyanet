/* eslint-disable prettier/prettier */
/* eslint-disable no-async-promise-executor */
import {UserManager, UserManagerSettings} from 'oidc-client-ts';
import {sleep} from './helpers';
// import { string } from 'yup';

const GOOGLE_CONFIG: UserManagerSettings = {
    authority: 'https://accounts.google.com',
    client_id: '',
    client_secret: '',
    redirect_uri: `${window.location.protocol}//${window.location.host}/callback`,
    scope: 'openid email profile',
    loadUserInfo: true
};

export const GoogleProvider = new UserManager(GOOGLE_CONFIG);

export const authLogin = (email: string, password: string, _level: string) => {
    return new Promise(async (res, rej) => {
        await sleep(500);

        const url = 'http://localhost:8000/api/login';

        fetch(url, {
            method: 'post',
            body: JSON.stringify({'username': email, 'password': password, 'level': _level}),
            headers: {
                'content-type' : 'application/json'
                }
            })
            .then(res => res.json())
            .then(res => {
                // console.log(res);
                email = res.data.username;
                _level = res.data;
                localStorage.level = res.data.id_level;
        }); 
        
        if (email != '') {
            localStorage.setItem(
                'authentication',
                JSON.stringify({profile: {email: email}})
            );
            return res({profile: {email: email}});
        }
        return rej({message: 'Credentials are wrong!'});

        // if (email === 'admin@example.com' && password === 'admin') {
        //     localStorage.setItem(
        //         'authentication',
        //         JSON.stringify({profile: {email: 'admin@example.com'}})
        //     );
        //     return res({profile: {email: 'admin@example.com'}});
        // }
        // return rej({message: 'Credentials are wrong!'});
    });
};

export const getAuthStatus = () => {
    return new Promise(async (res) => {
        await sleep(500);
        try {
            let authentication = localStorage.getItem('authentication');
            if (authentication) {
                authentication = JSON.parse(authentication);
                return res(authentication);
            }
            return res(undefined);
        } catch (error) {
            return res(undefined);
        }
    });
};
