package alx.common.test
{
  /**
   * Tester interface.
   * @author Alexander Volkov
   * @version 1.0
   */
  public interface ITester
  {
    /**
     * Sets label.
     * @param strValue String
     */
    function setLabel( strLabel:String):void;
    /**
     * Gets label.
     * @return String
     */
    function getLabel():String;
    /**
     * Checks value is true.
     * @param strTitle String
     * @param bTest Boolean
     * @return Boolean
     */
    function isTrue( strTitle:String, bTest:Boolean):Boolean;
    /**
     * Checks value is false.
     * @param strTitle String
     * @param bTest Boolean
     * @return Boolean
     */
    function isFalse( strTitle:String, bTest:Boolean):Boolean;
    /**
     * Checks value is equal to expected value.
     * @param strTitle String
     * @param testValue Object
     * @param correctValue Object
     * @return Boolean
     */
    function isEqual( strTitle:String, testValue:Object, correctValue:Object):Boolean;
    /**
     * Checks value is not equal to expected value.
     * @param strTitle String
     * @param testValue Object
     * @param correctValue Object
     * @return Boolean
     */
    function isNotEqual( strTitle:String, testValue:Object, correctValue:Object):Boolean;
    /**
     * Checks that this method not called.
     * @param strTitle String
     * @return Boolean
     */
    function notHere( strTitle:String):Boolean;
    /**
     * Invokes error in test process.
     * @param strTitle String
     * @param strComment String
     */
    function error( strTitle:String, strComment:String = ''):void;
    /**
     * Checks if was an error while test process.
     * @return Boolean
     */
    function isError():Boolean;    
  }
}