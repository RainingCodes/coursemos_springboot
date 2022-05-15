package dao;

import com.example.coursemos.domain.Store;

public interface StoreDao {
	
	Store getStore(String Id);
	
	Store shareSNS(String Id);
}
