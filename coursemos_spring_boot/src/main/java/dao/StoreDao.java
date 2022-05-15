package dao;

import domain.Store;

public interface StoreDao {
	
	Store getStore(String Id);
	
	Store shareSNS(String Id);
}
