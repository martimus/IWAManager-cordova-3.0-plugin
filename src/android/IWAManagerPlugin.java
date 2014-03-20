package com.obigo.iwamanager;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;

import android.content.Intent;
import android.util.Log;

public class IWAManagerPlugin extends CordovaPlugin {
    private static final String TAG = "IWAManagerPlugin";

    /**
     * Constructor.
     */
    public IWAManagerPlugin() { }

    /**
     * Executes the request and returns PluginResult.
     *
     * @param action            The action to execute.
     * @param args              JSONArray of arguments for the plugin.
     * @param callbackContext   The callback context used when calling back into JavaScript.
     * @return                  True if the action was valid, false otherwise.
     */
    public boolean execute(String action, JSONArray args, final CallbackContext callbackContext) throws JSONException {
        if (action.equals("seedSelected")) {
        	Log.d(TAG, "seed Selected called");
            String seedId = args.getString(0);
            String actId = args.getString(0);
        	Log.d(TAG, "seed id :" + seedId + ", act id :" + actId);

        	Intent intent = new Intent("com.obigo.iwa.ACTION_LOG");
        	intent.putExtra("seedId", seedId);
        	intent.putExtra("actId", actId);
        	
        	cordova.getActivity().sendBroadcast(intent);
        }
        return true;
    }
}
