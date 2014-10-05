using System;
using System.IO;
using System.Collections.Generic;

class Program
{
    static void Main(string[] args)
    {
        using (StreamReader reader = File.OpenText(args[0]))
        #using (StreamReader reader = File.OpenText("ReverseWords"))
        while (!reader.EndOfStream)
        {
            string line = reader.ReadLine();
            if (null == line || "" == line || "" == line.Trim())
                continue;
            var phrase = line.ToCharArray();
            InMemoryReverse(phrase, 0, phrase.Length - 1);
            
            var startOfWord = 0; 
            for(var i = 0; i <= phrase.Length; i++)
            {
               if(i == phrase.Length || phrase[i] == ' ')
               {
                      InMemoryReverse(phrase, startOfWord, i - 1);
                      startOfWord = i + 1;
               }
            }
            
            System.Console.Out.WriteLine(string.Join("", phrase));
        }
    }
    
    static Action<char[], int, int> InMemoryReverse = (t, s, e) =>
    {
       while(s < e)
       {
              var bucket = t[s];
              t[s] = t[e];
              t[e] = bucket;
              s++;
              e--;
       }
    };
}