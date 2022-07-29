public with sharing class LogCall {
    public LogCall() {

    }
/*
    public static void createTaskNew(Contact[] contacts){

        String[] contactIds = new String[contacts.size()];

        for(Integer i=0; i < contacts.size(); i++){
            contactIds[i] = contacts[i].getID();
        }
        Task task = new Task();
	    task.setSubject('Call');
	    task.setTaskWhoIds(contactIds);
	    SaveResult[] results = null;
	    try {
		    results = connection.create(new Task[] {
			task
		});
	    } catch (ConnectionException ce) {
		    ce.printStackTrace();
        }

    }
    */
}
