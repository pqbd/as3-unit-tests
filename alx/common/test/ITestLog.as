package alx.common.test
{
  /**
   * Test log interface.
   * @author Alexander Volkov
   * @version 1.0
   */
  public interface ITestLog
  {
    /**
     * Adds log line.
     * @param strMessage String
     * @param nDetalizationLevel uint default 0
     * @param bCallStackInfo Boolean default false
     * @return {@link alx.common.test.ITestLog this}
     */
    function addLine( strMessage:String, nDetalizationLevel:uint = 0, bCallStackInfo:Boolean = false):ITestLog;
    /**
     * Gets log lines.
     * @return Array
     */
    function getLines():Array;
    /**
     * Gets log content.
     * @param nOffset uint default 0
     * @return String
     */
    function toString( nOffset:uint = 0):String;
    /**
     * Clears the log.
     * @return {@link alx.common.test.ITestLog this}
     */
    function clear():ITestLog;
    /**
     * Sets log detalization level.
     * @param nLevel uint
     * @return {@link alx.common.test.ITestLog this}
     */
    function setDetalizationLevel( nLevel:uint):ITestLog;
    /**
     * Sets log call stack information reaction.
     * @param bFlag Boolean
     * @return {@link alx.common.test.ITestLog this}
     */
    function setShowCallStack( bFlag:Boolean):ITestLog;
  }
}