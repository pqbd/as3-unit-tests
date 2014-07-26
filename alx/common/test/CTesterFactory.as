package alx.common.test
{
  /**
   * Tester factory.
   * @author Alexander Volkov
   * @version 1.0
   */
  public class CTesterFactory
  {
    /** Tester prototype class*/
    private var m_testerClass:Class;

    /**
     * Creates tester factory.
     * @param testerClass Class
     */
    public function CTesterFactory( testerClass:Class):void
    {
      this.m_testerClass = testerClass;
    }

    /**
     * Tester fabric method.
     * @param strLabel String
     * @return {@link alx.common.test.ITester}
     */
    public function createTester( strLabel:String):ITester
    {
      return new this.m_testerClass( strLabel);
    }
    /**
     * Gets prototype class.
     * @return Class
     */
    public function getClass():Class
    {
      return this.m_testerClass;
    }
  }
}