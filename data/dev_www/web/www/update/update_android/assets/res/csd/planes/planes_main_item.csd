<GameFile>
  <PropertyGroup Name="planes_main_item" Type="Layer" ID="z5pfarm94ebdyjut0o7sw8lvikh1q6-n23gc" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.000000">
      </Animation>
      <ObjectData Name="root_wnd" ctype="GameNodeObjectData">
        <Size X="223.000000" Y="284.000000" />
        <Children>
          <AbstractNodeData Name="container" ActionTag="-378584238" Tag="70" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size Y="284" X="223" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="111.5" Y="142" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="255" G="200" R="150" />
            <Children>
              <AbstractNodeData Name="icon_sp" ActionTag="1803229583" Tag="72" RotationSkewX="0" RotationSkewY="0" LeftMargin="88.5" RightMargin="88.5" TopMargin="119" BottomMargin="119" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="46" X="46" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="111.5" Y="142" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="Default" Path="Default/Sprite.png" Plist="" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="pos_node" ActionTag="-38135650" Tag="177" RotationSkewX="0" RotationSkewY="0" LeftMargin="111.5" RightMargin="111.5" TopMargin="142" BottomMargin="142" CallBackType="None" CallBackName="None" ctype="SingleNodeObjectData">
                <Size Y="0" X="0" />
                <AnchorPoint ScaleX="0" ScaleY="0" />
                <Position X="111.5" Y="142" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
              </AbstractNodeData>
              <AbstractNodeData Name="image_bg" ActionTag="-1263168689" Tag="71" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" LeftEage="15" RightEage="15" TopEage="15" BottomEage="15" Scale9OriginX="15" Scale9OriginY="15" Scale9Width="189" Scale9Height="248" ctype="ImageViewObjectData">
                <Size Y="284" X="223" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="111.5" Y="142" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="planes_main_1002.png" Plist="resource/planes/planes_main.plist" />
              </AbstractNodeData>
              <AbstractNodeData Name="camp_sp" ActionTag="69580298" Tag="149" RotationSkewX="0" RotationSkewY="0" LeftMargin="8.5" RightMargin="167.5" TopMargin="232.5" BottomMargin="4.5" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="47" X="47" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="32" Y="28" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="planes_main_1007.png" Plist="resource/planes/planes_main.plist" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="progress_bg" ActionTag="1549416039" Tag="82" RotationSkewX="0" RotationSkewY="0" LeftMargin="32.5" RightMargin="32.5" TopMargin="276.5" BottomMargin="-11.5" LeftEage="9" RightEage="9" TopEage="7" BottomEage="7" Scale9OriginX="9" Scale9OriginY="7" Scale9Width="5" Scale9Height="5" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="19" X="158" />
                <AnchorPoint ScaleX="0" ScaleY="0.5" />
                <Position X="32.5" Y="-2" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1095.png" Plist="resource/common/common.plist" />
                <Children>
                  <AbstractNodeData Name="progress" ActionTag="551548108" Tag="83" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="1" BottomMargin="1" ProgressInfo="100" ctype="LoadingBarObjectData">
                    <Size Y="17" X="158" />
                    <AnchorPoint ScaleX="0" ScaleY="0.5" />
                    <Position X="0" Y="9.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <ImageFileData Type="PlistSubImage" Path="common_90006_4.png" Plist="resource/common/common.plist" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="progress_value" ActionTag="-754095523" Tag="84" RotationSkewX="0" RotationSkewY="0" LeftMargin="63" RightMargin="63" TopMargin="-2" BottomMargin="-2" FontSize="18" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="23" X="32" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="79" Y="9.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="0" G="0" R="0" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="name_txt" ActionTag="629792539" Tag="75" RotationSkewX="0" RotationSkewY="0" LeftMargin="87" RightMargin="87" TopMargin="244" BottomMargin="12" FontSize="22" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="28" X="49" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="111.5" Y="26" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="35" G="50" R="100" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="tips_txt" ActionTag="953953099" Tag="34" RotationSkewX="0" RotationSkewY="0" LeftMargin="39" RightMargin="39" TopMargin="176" BottomMargin="82" FontSize="20" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="26" X="145" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="111.5" Y="95" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="87" G="47" R="47" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="award_txt" ActionTag="1024125433" Tag="45" RotationSkewX="0" RotationSkewY="0" LeftMargin="91" RightMargin="91" TopMargin="277.5" BottomMargin="-16.5" FontSize="18" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="23" X="41" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="111.5" Y="-5" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="84" G="229" R="128" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="0" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
            </Children>
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>
