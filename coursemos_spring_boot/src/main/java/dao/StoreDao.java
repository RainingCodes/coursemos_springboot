package dao;

import com.example.demo.domain.Store;

public interface StoreDao {
	
	Store getStore(String Id);
	
	Store shareSNS(String Id);
}
