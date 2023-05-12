
import { useState,useEffect,createContext} from 'react';
import axios from 'axios'


export const AuthContext = createContext();

export const AuthContexProvider = ({ children }) => {
    const [currentUser, setCurrentUser] = useState(JSON.parse(localStorage.getItem("user") || null));
    
    const login = async (user) => {
    const res = await axios.post("http://localhost:8800/auth/login",user,{ withCredentials: true });
    setCurrentUser(res.data);
    };

    const logout = async (user) => {
        const res = await axios.post("http://localhost:8800/auth/logout",{ withCredentials: true })
        setCurrentUser(null);
        };    

    useEffect(() => {
        localStorage.setItem('user', JSON.stringify(currentUser));
    },[currentUser]);

    return<AuthContext.Provider value={{currentUser,login,logout}}>
        {children}
        </AuthContext.Provider>

}