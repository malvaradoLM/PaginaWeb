using System;
using System.Reflection;

namespace RPCommonLibrary
{
    public static class ExtensionMethods
    {
        public static void GatherFrom<TSelf, TSource>(this TSelf self, TSource source)
        {
            PropertyInfo[] sourceAllProperties = source.GetType().GetProperties();

            foreach (PropertyInfo sourceProperty in sourceAllProperties)
            {
                PropertyInfo selfProperty = self.GetType().GetProperty(sourceProperty.Name);
                if (selfProperty != null)
                {
                    var sourceValue = sourceProperty.GetValue(source, null);
                    selfProperty.SetValue(self, sourceValue, null);
                }
            }
        }
    }
}

