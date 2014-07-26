package alx.common.test
{
  /**
   * Log factory.
   * @author Alexander Volkov
   * @version 1.0
   */
  public class CLogFactory
  {
    /** Log prototype class*/
    private var m_logClass:Class;
    /** Log prototype class*/
    private var m_nDetalizationLevel:uint;
    /** Log prototype class*/
    private var m_bShowCallStack:Boolean;

    /**
     * Creates log factory.
     * @param logClass Class
     * @param nDetalizationLevel uint
     * @param bShowCallStack Boolean
     */
    public function CLogFactory( logClass:Class, nDetalizationLevel:uint, bShowCallStack:Boolean):void
    {
      this.m_logClass = logClass;
      this.m_nDetalizationLevel = nDetalizationLevel;
      this.m_bShowCallStack = bShowCallStack;
    }

    /**
     * Log fabric method.
     * @return {@link alx.common.test.ITestLog}
     */
    public function createLog():ITestLog
    {
      var log:ITestLog = new this.m_logClass();
      log.setDetalizationLevel( this.m_nDetalizationLevel)
         .setShowCallStack( this.m_bShowCallStack)
         ;
      return log;
    }
    /**
     * Gets prototype class.
     * @return Class
     */
    public function getClass():Class
    {
      return this.m_logClass;
    }
  }
}