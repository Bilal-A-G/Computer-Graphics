Shader "Custom/SimpleSpecular"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _AmbientStrength ("Ambient Strength", float) = 0 
        _DiffuseStrength ("Diffuse Strength", float) = 0 
        _SpecularStrength ("Specular Strength", float) = 0 
        _Shininess ("Shininess", float) = 0 
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface surf SimpleSpecular

        float _AmbientStrength;
        float _DiffuseStrength;
        float _SpecularStrength;
        float _Shininess;

        float4 LightingSimpleSpecular(SurfaceOutput o, fixed3 lightDirection, fixed3 viewDirection, fixed attenuation)
        {
            float3 halfVec = lightDirection + viewDirection;
            
            float3 diffuse = dot(o.Normal, normalize(lightDirection)) * _DiffuseStrength;
            float3 ambient = float3(1, 1, 1) * _AmbientStrength;
            float3 specular = pow(max(0, dot(o.Normal, halfVec)), _Shininess) * _SpecularStrength;

            float3 finalLight = ambient + diffuse + specular;
            return float4(finalLight.rgb * _LightColor0 * o.Albedo, 0);
        }
        
        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        fixed4 _Color;

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _Color.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
